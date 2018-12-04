From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 4 Dec 2018 12:17:37 +0100
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <28534b36-e0bc-c574-b731-8ff9f43cd448@mind.be>
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
 <87y39lm6e8.fsf@dell.be.48ers.dk> <20181122174417.7e101a15@windsurf>
 <20181123092754.4dd189cc@windsurf>
 <d1142785-90ff-2a41-b95a-263e10eb120d@mind.be>
 <20181204092848.26551792@windsurf>
 <34f48a56-a91c-0882-aead-246da14b3409@green-communications.fr>
 <28534b36-e0bc-c574-b731-8ff9f43cd448@mind.be>
Message-ID: <23676a9a-8e34-4871-b29b-472253f3ec9a@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/2018 12:02, Arnout Vandecappelle wrote:
> On 04/12/2018 11:32, Nicolas Cavallari wrote:
>> Adding an index on result_id helps:
>>
>> MariaDB [brautobuild]> create index resid on symbol_per_result (result_id);
>>
>> MariaDB [brautobuild]> select A.result_id from symbol_per_result A,
>> symbol_per_result B where A.result_id = B.result_id and A.symbol_id = (select id
>> from config_symbol where name = "BR2_INIT_SYSTEMD" and value = "y") and
>> B.symbol_id = (select id from config_symbol where name =
>> "BR2_TOOLCHAIN_USES_UCLIBC" and value = "y");
>> Empty set (9.55 sec)
> 
>  Maybe it would be even better to make (result_id, symbol_id) the primary key of
> symbol_per_result? Or do I misunderstand the implications of primary key?

i was a bit confused about the various id in symbol_per_result.  If
symbol_per_result.id is unused, then yes, remove it and make (result_id,
symbol_id) the primary key.

(i'm assuming that mysql can use an (a,b) index to search for a, it should be
the case now in 2018)
