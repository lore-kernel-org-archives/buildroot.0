From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Mon, 11 Feb 2013 15:18:18 +0200
Subject: [Buildroot] [PATCH 1/1] openpgm: new package
In-Reply-To: <20130211134547.02bedae4@skate>
References: <1360585826-17996-1-git-send-email-alexander.lukichev@gmail.com>
 <20130211134547.02bedae4@skate>
Message-ID: <5118EF9A.1030106@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas, All!

On 02/11/2013 02:45 PM, Thomas Petazzoni wrote:
> We no longer want to have patches that contain the package version in
> their filename.
Thanks, I originally based this on 2012.08 release and taught myself by manual (http://www.buildroot.net/downloads/manual/manual.html#patch-policy). I did not closely follow the mailing list. I'll fix this.

> Any reason not to package the most recent version available? Are there
> incompatibilities between 5.1.118 and 5.2.121 that makes 5.2.121
> unusable for zeromq?
I do recall that there were, for zeromq-2.2.0, though I'm not able to tell what went wrong back then. Hence two versions were tried: first the more recent, then 5.1.118-1~dfsg. Modifications in those two patches are the same, so it's no use to have two files. I'll check more closely if zeromq-2.2.0 can be made to work with the recent version of openpgm.  

>> +@@ -284,7 +284,8 @@ AC_RUN_IFELSE(
>> + 	[AC_MSG_RESULT([yes])
>> + 		pgm_unaligned_pointers=yes],
>> + 	[AC_MSG_RESULT([no])
>> +-		pgm_unaligned_pointers=no])
>> ++		pgm_unaligned_pointers=no],
>> ++	pgm_unaligned_pointers=yes)
> 
> Are we sure that pgm_unaligned_pointers=yes will be valid on all
> architectures?
> 
> Rather than hardcoding this, I would prefer if it was possible to pass
> a variable in the configure script environment to tell the result of
> this test.

Is there a way to determine if target architecture has unaligned pointers or aligned pointers?

>> +OPENPGM_VERSION = 5.1.118-1~dfsg
>> +OPENPGM_SOURCE = libpgm-$(OPENPGM_VERSION).tar.gz
> 
> Strange, the project is called openpgm but the tarball is named libpgm?
> Usually, we try to use the upstream name, but here it's unclear if we
> should choose libpgm or openpgm. Does the openpgm projects delivers
> something else than libpgm?

Not as far as I know.

>> +OPENPGM_DEPENDENCIES = 
> Not needed if it's empty.
> You should also add the OPENPGM_LICENSE and OPENPGM_LICENSE_FILES
Thanks, will be fixed.

>> +OPENPGM_AUTORECONF = YES
> 
> Since the source code comes as a tarball, it's uncommon to have to do
> an autoreconf. Could you add a comment right before this line that
> explains why it is needed?
Yes, I will do that. As Yann has mentioned, it's needed because the configure.ac has been patched.

>> +OPENPGM_CONF_ENV = ac_cv_file__proc_cpuinfo=yes ac_cv_file__dev_rtc=no \
>> +                   ac_cv_file__dev_hpet=no

Well, for that matter, these tests too may not be valid for all the target architectures. Could this somehow be determined in advance or?.. OK, I think I know the answer. Is it OK to leave them as is? An alternative would be to try to prompt the user in Kconfig.

>> +OPENPGM_POST_EXTRACT_HOOKS += OPENPGM_EXTRACT_FIX
> Have you tried to replace this post extract fix by:
> OPENPGM_SUBDIR = openpgm/pgm/
>  ?

No. I will try. Thanks.

--
Best regards,
  Alexander Lukichev
