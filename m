From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Jun 2014 17:34:53 +0100
Subject: [Buildroot] [PATCH 3/5] gnupg2: new package
In-Reply-To: <k2096bxgbf.ln2@ID-313208.user.individual.net>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
 <1402062269-57018-4-git-send-email-Vincent.Riera@imgtec.com>
 <k2096bxgbf.ln2@ID-313208.user.individual.net>
Message-ID: <5391EDAD.6070908@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/06/2014 03:33 PM, Bernd Kuhls wrote:
> Vicente Olivert Riera
> <Vincent.Riera@imgtec.com> wrote in
> news:1402062269-57018-4-git-send-email-Vincent.Riera at imgtec.com:
>
>> +     select BR2_PACKAGE_PTH
>> +     depends on !BR2_TOOLCHAIN_USES_UCLIBC # pth
>
> Hi,

Hello Bernd, all,

> afaik gnupg2 is compatible with uclibc if you use the existing libpthsem
> package instead of your new pth package.

no, it doesn't build (as is) using libpthsem. Here is why:

First, because it looks for pth-config, which is installed by pth. 
libpthsem installs pthsem-config.

Second, although you try to make a pth-config symlink pointing to 
pthsem-config, it will fail again because "pthsem-config --version" 
outputs the version in a different format than pth-config, so the pth 
version check in gnupg2's configure script will fail.

Third, although you make a copy of pthsem-config calling it pth-config, 
and you modify it to output the version in the same way as the original 
pth-config does, it will fail again because it also looks for pth.h 
which is installed by pth. pthsem installs pthsem.h.

Now, if you make a pth.h symlink pointing to pthsem.h, then it builds fine.

To summarize: if you want to build gnupg2 using libpthsem instead of 
pth, you will need to patch libpthsem package to install a compatibility 
pth-config script (just a copy with the --version modification) and a 
compatibility pth.h symlink.

So, we have three options here and we need to decide one of them:

Option 1: add the new pth package
   pros: -there is no need to patch libpthsem
   cons: -gnupg2 will not work with uclibc

Option 2: patch the libpthsem package
   pros: -no need to add pth package
         -gnupg2 will work with uclibc
   cons: -we need to patch libpthsem to install compatibility stuff

Option 3: patch gnupg2 to use libpthsem in case of pth is missing
   pros: -no need to add pth package
         -gnupg2 will work with uclibc
         -gnupg2 will work with both libpthsem and pth
   cons: -patching gnupg2 source code should be accepted upstream

Let's vote! :)

> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Vincent
