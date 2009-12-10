From: Stephan Raue <mailinglists@openelec.tv>
Date: Thu, 10 Dec 2009 16:48:26 +0100
Subject: [Buildroot] Creating user accounts in rootfs
In-Reply-To: <87skbivqqi.fsf@macbook.be.48ers.dk>
References: <4B053FEB.20104@free.fr> <87skbivqqi.fsf@macbook.be.48ers.dk>
Message-ID: <20091210164826.21316knhmltxhefe@login-64.openelec.tv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zitat von Peter Korsgaard <jacmet@uclibc.org>:

>>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:
>
> Hi,
>
>  Julien> Does someone know a better way than the following to create user
>  Julien> accounts ? :
>  Julien> * on the target use "adduser xxx"
>  Julien> * then copy target's "/etc/passwd" and "/etc/shadow" to Host's
>  Julien> "buildroot/target/..../rootfs/target_skeleton/..."
>  Julien> * rebuild rootfs
>
>  Julien> My goal is to have a rootfs with preset user accounts, ready to
>  Julien> be used as soon as the rootfs image has been flashed.
>
> No, that's certainly the easiest solution (and how I normally do it).
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>

i use an different way (but not with buildroot):

i have 2 functions:

add_user() {
   # Usage: add_user "username" "password" "userid" "groupid"  
"description" "home" "shell"
   mkdir -p ${INSTALL}/etc
   touch ${INSTALL}/etc/passwd
   if [ -z "`grep "$1:" ${INSTALL}/etc/passwd`" ]; then
     echo "$1:$2:$3:$4:$5:$6:$7" >> ${INSTALL}/etc/passwd
   fi
}

add_group() {
   # Usage: add_group "groupname" "groupid"
   mkdir -p ${INSTALL}/etc
   touch ${INSTALL}/etc/group
   if [ -z "`grep "$1:" ${INSTALL}/etc/group`" ]; then
     echo "$1:x:$2:" >> ${INSTALL}/etc/group
   fi
}

that can be called from the buildsripts (like your makefiles) with for  
example:

add_user haldaemon x 68 68 "HAL daemon" "/" "/bin/sh"
add_group haldaemon 68

for the password i dont use /etc/shadow (but you can do this also).
i install an second busybox for my host in in my toolchain dir with  
only CONFIG_CRYPTPW=y is set so i have busyboxs cryptpw utility on my  
host

  i have set an variable ROOT_PASSWORD with my rootpassword

and to set my root password i call the function add_user like:

ROOT_PWD="`$ROOT/$TOOLCHAIN/bin/cryptpw $ROOT_PASSWORD`"
add_user root "$ROOT_PWD" 0 0 "Root User" "/storage" "/bin/sh"
add_group root 0

stephan


-- 
               ### OpenELEC.tv ###
The free and open Mediacenter Distribution 4 you
               http://www.openelec.tv
