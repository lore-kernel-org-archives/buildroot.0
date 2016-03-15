From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 15 Mar 2016 23:09:00 +0100
Subject: [Buildroot] Another lame user question.
In-Reply-To: <CAJJ6jxs-aPoTBv6OMoKkKN64OAscmG41dTCqrqsB6xkVSnAD+w@mail.gmail.com>
References: <CAJJ6jxvqALyD4=1wPUdh7JKpv1fKkfoYcj-m4FZLe+1P2wnnFQ@mail.gmail.com>
 <20160314053654.GF7678@tarshish>
 <CAJJ6jxs-aPoTBv6OMoKkKN64OAscmG41dTCqrqsB6xkVSnAD+w@mail.gmail.com>
Message-ID: <CAHXCMMKHC8ktrqF9aH61Vhck_W6_-Z6Qg1L=oiN-1KuT5Aw1fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 14, 2016 at 6:45 PM, Steve Calfee <stevecalfee@gmail.com> wrote:
> On Sun, Mar 13, 2016 at 10:36 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>> Hi Steve,
>>
>> On Sun, Mar 13, 2016 at 10:14:57PM -0700, Steve Calfee wrote:
>>> Hi, as the title says, I have another user question. I did explore
>>> google and the buildroot docs.
>>>
>>> I am trying to move the mysql directories to my writeable ubi
>>> partition. Somewhere someone create the mysql user. Where did it get
>>> created? However, there is no mysql group. I cannot get mysql to start
>>> from a ubi partition mounted at /data/mysql. Who and where is the
>>> mysql user created (some files have that as a user)
>>>
>>> The buildroot manual documents the makeusers syntax, but what file do
>>> I create where? Will that work for mysql?
>>
>> Quoting package/mysql/mysql.mk:
>>
>> define MYSQL_USERS
>>         mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
>> endef
>>
>> baruch
>>
> Hi Baruch, thanks.
>
> So somewhere in the infra a script goes through all *_USERS variables
> and builds the password file etc for users?
Yes, see [1, 2].

>
> What if I want to move /var/mysql?
As long as mysql binaries and configuration files are kept in sync, it
is possible. But the proper way to do this is changing this in the
configure options (see [3]).

> Who uses /var/mysql as the "home" directory?
Check the etc/passwd file from your target filesystem, but in grepping
mainline Buildroot source will tell you that no-one but mysql user is
using /var/mysql (as Baruch already said)...

> And how does that relate to datadir that is defined in my.cnf?
You may want to check this [3].
Don't know much about mysql, but I guess /var/mysql is driven by the
localstatedir option.
Take some time to learn what does each option, but tweaking this
certainly means patching the Buildroot's mysql.mk file.

>
> Anyway finding out that the user is created in the make file will
> really help me research this problem of setting up mysql and moving
> its datadir to another ubi partition.
>
> Thanks, Steve
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] https://buildroot.org/downloads/manual/manual.html#generic-package-reference
[2] https://buildroot.org/downloads/manual/manual.html#makeuser-syntax
[3] http://dev.mysql.com/doc/refman/5.1/en/source-configuration-options.html

Regards,

-- 
Samuel
