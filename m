From: =?UTF-8?Q?Thiago_A=2E_Corr=C3=AAa?= <thiago.correa@gmail.com>
Date: Fri, 20 May 2016 11:17:21 -0300
Subject: [Buildroot] [PATCH v5] domoticz: new package
In-Reply-To: <15dbf3d6-df7f-8c61-8abb-da22eb93234d@mind.be>
References: <30357_1462263258_57285DDA_30357_1304_1_d5a28a6b-c41a-4918-a007-feff96280fbe@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
 <573CA642.8050305@free.fr>
 <CAExDhvZaABjAALGBdro-0CLFJiTZnAnKcNzBwz3SyZHO+0NifQ@mail.gmail.com>
 <15dbf3d6-df7f-8c61-8abb-da22eb93234d@mind.be>
Message-ID: <CAExDhvbSqETGK1jaDstWjc049Z-NObWjjf39_aQwvqUgaT4pLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 19, 2016 at 6:21 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05/18/16 20:43, Thiago A. Corr?a wrote:
>> There is a problem with domoticz on JFFS2 systems, because it enables
>> some pragmas. Sqlite then tries to mmap on JFFS2 which is not
>> supported and everything fails, Domoticz can't even create the tables.
>>  I fixed it changing sqlite.mk to add:
>>
>> +SQLITE_CFLAGS += -DSQLITE_TEMP_STORE=3
>> +SQLITE_CFLAGS += -DSQLITE_SHM_DIRECTORY=/tmp
>> +SQLITE_CFLAGS += -DSQLITE_OMIT_WAL
>
>  If I understand correctly, the problem is that domoticz is creating sqlite
> tables with pragmas that don't work on JFFS2, right? In that case, it's a
> problem of domoticz and it shouldn't affect all other users of sqlite. In other
> words, it's not OK to change the build options of sqlite.

I would think it's a problem with SQLite, it just happens that we
figured it out with Domoticz. The pragmas are documented, any software
could attempt to use them.

>  On the other hand, if sqlite never works at all on jffs2, then I think it could
> be useful to add a config option to sqlite "support filesystems without mmap".
>
>>
>> Maybe it could be added to the patch, checking if JFFS2 output is enabled.
>
>  No, it's very well possible (likely even) that the filesystem on which the
> database is stored is different from the rootfs.
>

They could be on different partitions all using JFFS2.
UBIFS happens to support mmap, don't know of other embedded filesystems.
