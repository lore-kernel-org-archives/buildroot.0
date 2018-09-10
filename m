From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 10 Sep 2018 23:20:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/gdb: use stat() privided by the
 system
In-Reply-To: <20180910174900.0b9f4133@windsurf>
References: <20180909163750.14196-1-romain.naour@gmail.com>
 <20180909163750.14196-2-romain.naour@gmail.com>
 <20180910174900.0b9f4133@windsurf>
Message-ID: <d588888e-dccc-50c8-5a6e-9c5c46a512cb@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Adding the gdb-patches ml and Rich Felker in Cc.

Le 10/09/2018 ? 17:49, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Sun,  9 Sep 2018 18:37:50 +0200, Romain Naour wrote:
>> Use the same workaround [1] as gnulib use to get the original
>> definition of stat. Otherwise with musl toolchains, gnulib try to use
>> rpl_stat which is not defined.
>>
>> Fixes:
>> https://gitlab.com/free-electrons/toolchains-builder/-/jobs/95552308
>>
>> [1] http://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stat.c?id=c9d72f69bd201a1ab31464d91f234ea1817fe0e1
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> I am confused by this patch. Why do we need that? The <sys/stat.h> on
> my system doesn't test __need_system_sys_stat_h. Is this a workaround
> to force gnulib to not provide its own stat() replacement ?
> 
> Why is gnulib misbehaving here ? We have tons of gnulib related hacks
> in gdb.mk, and this start to pile up quite a bit. Why do we have all
> those gnulib issues with gdb ? Why not with tons of other packages that
> also use gnulib ?

There are too many questions here, I can't answer.
There are some (old) hack with coreutils like gl_cv_func_gettimeofday_clobber
which is in Buildroot since a long time. I can't tell for every gnulib based
packages...

> 
>> +Use the same workaround [1] as gnulib use to get the original
>> +definition of stat. Otherwise with musl toolchains, gnulib try to use
>> +rpl_stat which is not defined.
> 
> Well rpl_stat() is supposed to be implemented by gnulib. So basically
> gnulib tells gdb: please don't use stat() but my rpl_stat() wrapper,
> but then gnulib doesn't provide rpl_stat().
> 
> Any idea what's happening here ?

As far I can tell, the regression has been introduced by this commit:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2441702a72f324e41a1624dc042b334f375e2d81

Best regards,
Romain

> 
> Thomas
> 
