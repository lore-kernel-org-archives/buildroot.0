From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 4 Dec 2018 11:32:36 +0100
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <20181204092848.26551792@windsurf>
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
 <87y39lm6e8.fsf@dell.be.48ers.dk> <20181122174417.7e101a15@windsurf>
 <20181123092754.4dd189cc@windsurf>
 <d1142785-90ff-2a41-b95a-263e10eb120d@mind.be>
 <20181204092848.26551792@windsurf>
Message-ID: <34f48a56-a91c-0882-aead-246da14b3409@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/2018 09:28, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 27 Nov 2018 22:20:37 +0100, Arnout Vandecappelle wrote:
> 
>>  It's hard to predict the efficiency of SQL statements, but I would expect
>> something like this to be more efficient:
>>
>> select * from results
>>   inner join (select result_id from symbol_per_result A, symbol_per_result B
>>               where A.result_id = B.result_id
>>                 and A.symbol_id = (select id from config_symbol
>>                                    where name = "BR2_INIT_SYSTEMD")
>>                 and A.value = "y"
>>                 and B.symbol_id = (select id from config_symbol
>>                                    where name = "BR2_TOOLCHAIN_USES_UCLIBC")
>>                 and B.value = "y")
>>     as foo
>>   on foo.result_id = results.id
>> where builddate > '2018-09-01';
> 
> This query doesn't work as-is. First:
> 
> ERROR 1052 (23000): Column 'result_id' in field list is ambiguous
> 
> Because the "select result_id" in the inner query is ambiguous, using
> A.result_id gets passed that.
> 
> Then, the "value" field does not exist in the symbol_per_result table.
> It's the config_symbol table that associates a symbol name and its
> value, so I changed the inner query to:
> 
> select A.result_id from symbol_per_result A, symbol_per_result B
> 	where A.result_id = B.result_id and
> 	A.symbol_id = (select id from config_symbol where name = "BR2_INIT_SYSTEMD" and value = "y") and
> 	B.symbol_id = (select id from config_symbol where name = "BR2_TOOLCHAIN_USES_UCLIBC" and value = "y");
> 
> but that query itself already takes a significant amount of time to
> complete:
> 
> mysql> select A.result_id from symbol_per_result A, symbol_per_result B where A.result_id = B.result_id and A.symbol_id = (select id from config_symbol where name = "BR2_INIT_SYSTEMD" and value = "y") and B.symbol_id = (select id from config_symbol where name = "BR2_TOOLCHAIN_USES_UCLIBC" and value = "y");
> Empty set (3 min 52.15 sec)

an "explain extended select [...]" on this seems to says? that mysql browses
every row of the table twice, because there is no index to use.

Adding an index on result_id helps:

MariaDB [brautobuild]> create index resid on symbol_per_result (result_id);

MariaDB [brautobuild]> select A.result_id from symbol_per_result A,
symbol_per_result B where A.result_id = B.result_id and A.symbol_id = (select id
from config_symbol where name = "BR2_INIT_SYSTEMD" and value = "y") and
B.symbol_id = (select id from config_symbol where name =
"BR2_TOOLCHAIN_USES_UCLIBC" and value = "y");
Empty set (9.55 sec)

> I think the issue is that this query is operating on the full set of
> results, and that the filtering on the build date to reduce the number
> of build results to consider happens afterwards in the outermost query.
> I'm really no SQL guru, but since we're interested only in querying the
> results for the last few weeks or months, I would assume it should be
> faster to first filter the results we're interested in by build date,
> and then only do this massive symbol/value research.

There is no index on builddate, so there is no way around a full scan of the
table.  But there, adding an index on date does not seems to do much, probably
because results after 2019-09-01 still represent 1/4 of all results (and mysql
guesses that it only filters 50% of the results), so using an index maybe does
not do enough to cull the results.

But yeah, most read performance problems can be resolved by adding indexes, at
the expense of disk space and write performance.

(There are also ways to reduce the space taken by the database by splitting
duplicate fields into tables, but i don't think it would improve performance.)

[?] The output of mysql explain is pretty horrible. There was
https://mariadb.org/explain_analyzer/analyze/ but it seems to be broken now :(
