From: Linus <linus@cosmos-ink.net>
Date: Sun, 17 May 2020 13:31:45 +0200
Subject: [Buildroot] [PATCH] package/nodejs: expose capability to
 compile host library
In-Reply-To: <20200517093524.66886802@gmx.net>
References: <20200516235745.3551-1-linus@cosmos-ink.net>
 <20200517093524.66886802@gmx.net>
Message-ID: <072a45c0-b60d-4bc9-cc67-60b2cdffb691@cosmos-ink.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> Indent should use tabs (instead of spaces)...

I'm sorry for that. I've overlooked that change (ported it
from the repository I'm working with).
I git fixuped it. The fixed patch is below.

Regards,
Linus


To use nodejs on the host (independant of the actual system)
to create some static files to place onto the target rootfs
nodejs can be very helpful.

The provided nodejs package didn't show the possibility to
create a host package. But upon further examination I noticed
that the package does it in fact (in the .mk). It specifies
dependencies for the package with the host prefix and also
invokes $(host-generic-package) as well as $(generic-package)
which is the only one assumed from the config.

This commit adds a Config.in.host file that uses the
dependencies given from HOST_NODEJS_DEPENDENCIES in the makefile.
(It also add the host config to the package overview.)

With this change other packages can require BR2_PACKAGE_HOST_NODEJS
without any problems or the buildsystem not fully knowing about this.
Seems that someone added the capability (as a step for the cross-
compiled nodejs) and didn't notice that this is a handy package by itself.

When installing global npm packages (with -g), the parameter
`--prefix $(HOST_DIR)` can be used to ensure that nodejs doesn't try
to install it onto the real host filesystem.

I already used this change to create static web files from Angular
and place onto a target that doesn't need nodejs itself.

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
---
?package/Config.in.host??????? | 1 +
?package/nodejs/Config.in.host | 5 +++++
?2 files changed, 6 insertions(+)
?create mode 100644 package/nodejs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index f1246c708f..510249a496 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -48,6 +48,7 @@ menu "Host utilities"
???? source "package/mtd/Config.in.host"
???? source "package/mtools/Config.in.host"
???? source "package/mxsldr/Config.in.host"
+??? source "package/nodejs/Config.in.host"
???? source "package/omap-u-boot-utils/Config.in.host"
???? source "package/openocd/Config.in.host"
???? source "package/opkg-utils/Config.in.host"
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
new file mode 100644
index 0000000000..2169762b1b
--- /dev/null
+++ b/package/nodejs/Config.in.host
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_HOST_NODEJS
+??? bool "host nodejs"
+??? select BR_PACKAGE_HOST_LIBOPENSSL
+??? select BR_PACKAGE_HOST_PYTHON
+??? select BR_PACKAGE_HOST_ZLIB
-- 
2.26.2


Am 17.05.20 um 09:35 schrieb Peter Seiderer:
> Hello Linus,
>
> On Sat, 16 May 2020 23:57:45 +0000, Linus Kaschulla <linus@cosmos-ink.net> wrote:
>
>> To use nodejs on the host (independant of the actual system)
>> to create some static files to place onto the target rootfs
>> nodejs can be very helpful.
>>
>> The provided nodejs package didn't show the possibility to
>> create a host package. But upon further examination I noticed
>> that the package does it in fact (in the .mk). It specifies
>> dependencies for the package with the host prefix and also
>> invokes $(host-generic-package) as well as $(generic-package)
>> which is the only one assumed from the config.
>>
>> This commit adds a Config.in.host file that uses the
>> dependencies given from HOST_NODEJS_DEPENDENCIES in the makefile.
>> (It also add the host config to the package overview.)
>>
>> With this change other packages can require BR2_PACKAGE_HOST_NODEJS
>> without any problems or the buildsystem not fully knowing about this.
>> Seems that someone added the capability (as a step for the cross-
>> compiled nodejs) and didn't notice that this is a handy package by itself.
>>
>> When installing global npm packages (with -g), the parameter
>> `--prefix $(HOST_DIR)` can be used to ensure that nodejs doesn't try
>> to install it onto the real host filesystem.
>>
>> I already used this change to create static web files from Angular
>> and place onto a target that doesn't need nodejs itself.
>>
>> Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
>> ---
>>  package/Config.in.host        | 1 +
>>  package/nodejs/Config.in.host | 5 +++++
>>  2 files changed, 6 insertions(+)
>>  create mode 100644 package/nodejs/Config.in.host
>>
>> diff --git a/package/Config.in.host b/package/Config.in.host
>> index f1246c708f..510249a496 100644
>> --- a/package/Config.in.host
>> +++ b/package/Config.in.host
>> @@ -48,6 +48,7 @@ menu "Host utilities"
>>  	source "package/mtd/Config.in.host"
>>  	source "package/mtools/Config.in.host"
>>  	source "package/mxsldr/Config.in.host"
>> +	source "package/nodejs/Config.in.host"
>>  	source "package/omap-u-boot-utils/Config.in.host"
>>  	source "package/openocd/Config.in.host"
>>  	source "package/opkg-utils/Config.in.host"
>> diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
>> new file mode 100644
>> index 0000000000..af8d7b4e44
>> --- /dev/null
>> +++ b/package/nodejs/Config.in.host
>> @@ -0,0 +1,5 @@
>> +config BR2_PACKAGE_HOST_NODEJS
>> +	bool "host nodejs"
>> +	select BR_PACKAGE_HOST_LIBOPENSSL
>> +    select BR_PACKAGE_HOST_PYTHON
>> +    select BR_PACKAGE_HOST_ZLIB
> Indent should use tabs (instead of spaces)...
>
> Regards,
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200517/908a07d6/attachment.asc>
