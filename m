From: Kiril Maler <kiril.maler@gmail.com>
Date: Mon, 4 Jun 2012 09:26:39 +0200
Subject: [Buildroot] [PATCH] added package sftpserver
Message-ID: <CABJxTWFdYodgaKy3vG03aJrxnerCrxTsjRPWm1q8U_XkQukz0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Date: Fri, 1 Jun 2012 16:57:41 +0200
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] added package sftpserver
> Message-ID: <20120601165741.04be3924@skate>
> Content-Type: text/plain; charset=UTF-8
>
> Hello,
>
> Le Fri, 1 Jun 2012 16:35:31 +0200,
> Kiril Maler <kiril.maler@gmail.com> a ?crit :
>
>> +++ b/package/sftpserver/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_SFTPSERVER
>> + ? ? bool "sftpserver"
>> + ? ? depends on BR2_PACKAGE_DROPBEAR
>> + ? ? select BR2_PACKAGE_ZLIB
>> + ? ? help
>> + ? ? ? sftp-server only from openssh suite. It allows mounting
>> + ? ? ? the rootfs of embedded board through sshfs, for example
>> + ? ? ? sshfs root at 192.168.2.1:/ /mnt/board-rootfs
>> +
>> + ? ? ? Unmount with 'fusermount -u -z /mnt/board-rootfs'
>
>> +OPENSSH_VERSION = 5.9p1
>> +SFTPSERVER_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
>> +SFTPSERVER_SOURCE=openssh-$(OPENSSH_VERSION).tar.gz
>> +SFTPSERVER_VERSION=openssh-$(OPENSSH_VERSION)
>
> We already have a package for openssh. Since this is also using the
> same source tarball, I think it should rather be integrated as options
> to the openssh package.
>
> Regards,
>
> Thomas
> --


Hello,

I see three main reasons for not adding sftpserver as option in openssh package:

1. It is more intuitive for a developer configuring a small embedded
system to see
the sftp-server under dropbear ssh suite:
 ...
 [ ] dnsmasq
 [*] dropbear
 [*]   disable reverse DNS lookups
 [*]   optimize for size
 [ ]   log dropbear access to wtmp
 [ ]   log dropbear access to lastlog
 [*]   sftpserver               <--------------- ~50k single binary,
no libs/dependencies
 [ ] ebtables
 [ ] ethtool
 ...

2. My patch changes the openssh source code in such a way, that it
becomes completely incompatible
with openssh  - openssl+libcrypt are not compiled/required, a openssl
.h file is faked with symbol link,
the only TARGET left in Makefille.in is sftp-server, etc subtle fixes.
Extracting a binary from openssh without pulling 10's  of *.h files
and openssl+libcrypt+cyphers is like pulling a tooth ...
That is why the package is compiled in own directory
.../output/sftpserver-openssh-5.9p1/

3. I do not see an easy way to apply one patch, but ignore another in buildroot.
If I add my patch in packages/openssh, then a person compiling openssh
will get only sftp-server,
because of changed Configure.ac/Makefile.in rules.


Thomas, probably it is possible to build only sftp-server from openssh
by doing deep changes
in Confgiure.ac, and adding a flag --sftp-server-only   or something
similar, but I am not so familiar
with 'autotools' to do this, and I do not see any added value from
such an exercise.

I see one (possible) reason to add sftp-server as part of openssh
configuration and directory -
if in the future there is any security patch, concerning also
sftp-server source code file,
then the security fix patch must be added in .../packages/openssh
only. Most probably this will be fixed by
moving to next openssh version.

Best regards,
Kiril
