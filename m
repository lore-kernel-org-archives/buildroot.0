From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Nov 2018 22:20:37 +0100
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <20181123092754.4dd189cc@windsurf>
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
 <87y39lm6e8.fsf@dell.be.48ers.dk> <20181122174417.7e101a15@windsurf>
 <20181123092754.4dd189cc@windsurf>
Message-ID: <d1142785-90ff-2a41-b95a-263e10eb120d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/11/2018 09:27, Thomas Petazzoni wrote:
[snip]
> mysql> select * from (select * from results where builddate > '2018-09-01') as foo inner join symbol_per_result on symbol_per_result.result_id=foo.id where symbol_per_result.symbol_id=(select id from config_symbol where name="BR2_INIT_SYSTEMD" and value="y");
[snip]
> If anybody knows how to speed up this SQL query and/or adjust the SQL
> database schema to make it faster, it would be nice. I can provide a
> dump of the SQL database.

 It's hard to predict the efficiency of SQL statements, but I would expect
something like this to be more efficient:

select * from results
  inner join (select result_id from symbol_per_result A, symbol_per_result B
              where A.result_id = B.result_id
                and A.symbol_id = (select id from config_symbol
                                   where name = "BR2_INIT_SYSTEMD")
                and A.value = "y"
                and B.symbol_id = (select id from config_symbol
                                   where name = "BR2_TOOLCHAIN_USES_UCLIBC")
                and B.value = "y")
    as foo
  on foo.result_id = results.id
where builddate > '2018-09-01';

 I do assume that symbol_per_result is indexed or keyed on symbol_id so lookups
are fast, right?

 The filtering on builddate could of course be made a lot faster if the
builddate was also added to the symbol_per_result table. But the again, you
could add all of results to the symbol_per_result table...

 Regards,
 Arnout
