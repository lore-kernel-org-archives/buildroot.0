From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Dec 2018 12:02:37 +0100
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <34f48a56-a91c-0882-aead-246da14b3409@green-communications.fr>
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
 <87y39lm6e8.fsf@dell.be.48ers.dk> <20181122174417.7e101a15@windsurf>
 <20181123092754.4dd189cc@windsurf>
 <d1142785-90ff-2a41-b95a-263e10eb120d@mind.be>
 <20181204092848.26551792@windsurf>
 <34f48a56-a91c-0882-aead-246da14b3409@green-communications.fr>
Message-ID: <28534b36-e0bc-c574-b731-8ff9f43cd448@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/12/2018 11:32, Nicolas Cavallari wrote:
>> select A.result_id from symbol_per_result A, symbol_per_result B
>> 	where A.result_id = B.result_id and
>> 	A.symbol_id = (select id from config_symbol where name = "BR2_INIT_SYSTEMD" and value = "y") and
>> 	B.symbol_id = (select id from config_symbol where name = "BR2_TOOLCHAIN_USES_UCLIBC" and value = "y");
>>
>> but that query itself already takes a significant amount of time to
>> complete:
>>
>> mysql> select A.result_id from symbol_per_result A, symbol_per_result B where A.result_id = B.result_id and A.symbol_id = (select id from config_symbol where name = "BR2_INIT_SYSTEMD" and value = "y") and B.symbol_id = (select id from config_symbol where name = "BR2_TOOLCHAIN_USES_UCLIBC" and value = "y");
>> Empty set (3 min 52.15 sec)
> an "explain extended select [...]" on this seems to says? that mysql browses
> every row of the table twice, because there is no index to use.
> 
> Adding an index on result_id helps:
> 
> MariaDB [brautobuild]> create index resid on symbol_per_result (result_id);
> 
> MariaDB [brautobuild]> select A.result_id from symbol_per_result A,
> symbol_per_result B where A.result_id = B.result_id and A.symbol_id = (select id
> from config_symbol where name = "BR2_INIT_SYSTEMD" and value = "y") and
> B.symbol_id = (select id from config_symbol where name =
> "BR2_TOOLCHAIN_USES_UCLIBC" and value = "y");
> Empty set (9.55 sec)

 Maybe it would be even better to make (result_id, symbol_id) the primary key of
symbol_per_result? Or do I misunderstand the implications of primary key?

 Regards,
 Arnout
