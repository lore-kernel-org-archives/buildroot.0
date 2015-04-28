From: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
Date: Tue, 28 Apr 2015 10:36:12 -0400
Subject: [Buildroot] [PATCH v3 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <20150427041126.GQ2258@tarshish>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <1430095555-8484-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <20150427041126.GQ2258@tarshish>
Message-ID: <553F9ADC.8080703@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-04-27 12:11 AM, Baruch Siach wrote:
> Hi Emeric,

Hi Baruch,

>>
>> Change-Id: I42b640e845bb4195fb7b160281b16ee40883f01f
>
> This Gerrit specific line is not useful for upstream Buildroot. Please remove.

Sure.

>
>> Signed-off-by: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
>
> [snip]
>
>> diff --git a/docs/manual/clean-target-filesystem.txt
>> b/docs/manual/clean-target-filesystem.txt
>> new file mode 100644
>> index 0000000..3e8181e
>> --- /dev/null
>> +++ b/docs/manual/clean-target-filesystem.txt
>> @@ -0,0 +1,39 @@
>> +// -*- mode:doc; -*-
>> +// vim: set syntax=asciidoc:
>> +
>> +[[clean-target-filesystem]]
>> +==== Clean target filesystem
>> +
>> +There are various cases where you would like to clean the target
>> +filesystem. Especially once you understood that buildroot does not
>> +have rules to uninstall files. Let's take some examples:
>> +
>> +1. You enabled +PACKAGE_OPENSSH+ to have a SSH server running on your
>> +   board. But you figure out that +sshd+ does not run well on your
>> +   target's architecture. Thus you decide to disable +PACKAGE_OPENSSH+
>> +   and enable +PACKAGE_DROPBEAR+ instead. You run +make+: +dropbear+
>> +   gets built and installed, fine. But +openssh+ files are still present
>> +   in +output/target+!
>> +
>> +2. You enabled +PACKAGE_NTPD+ and set the local timezone to
>> +   +America/Montreal+ with +BR2_TARGET_LOCALTIME+ config. Then you find
>> +   out that +Montreal+ local has been replaced by +Toronto+ (French
>> +   looks like a rogue language). You enter +make menuconfig+, make the
>> +   change, save, and run +make+ again. Problem:
>> +   +output/target/etc/timezone+ still has +America/Montreal+ content!
>> +
>> +Solution to this is either to identify which package to reconfigure, or
>> +remove files manually, or destroy the target filesystem and recreate it.
>> +This latter option is convenient: you don't have to care about which
>> +packages to rebuild, and it is quite fast. Here is how to recreate your
>> +target filesystem, and get rid of filesystem _stains_:
>> +
>> +------------------
>> +make target-clean
>> +make
>> +------------------
>> +
>> ++target-clean+ removes +output/target+. That tells buildroot to recreate
>> +the target skeleton, and install each package again. This is a
>> +convenient way to rebuild your target filesystem cleanly without
>> +rebuilding everything.
>
> The warning is worth repeating here, I think.

I don't like to repeat things. I suggest to move the warning here and 
put emphasis on the link from full-rebuild to here.

>
>> diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
>> index 6faa67a..82385ae 100644
>> --- a/docs/manual/rebuilding-packages.txt
>> +++ b/docs/manual/rebuilding-packages.txt
>> @@ -39,17 +39,22 @@ can help you understand how to work with Buildroot:
>>      you would like to have SSL support in +ctorrent+, so you enable the
>>      +openssl+ package in Buildroot configuration and restart the
>>      build. Buildroot will detect that +openssl+ should be built and
>> -   will be build it, but it will not detect that +ctorrent+ should be
>> -   rebuilt to benefit from +openssl+ to add OpenSSL support. You will
>> -   either have to do a full rebuild, or rebuild +ctorrent+ itself.
>> +   will build it, but it will not detect that +ctorrent+ should be
>> +   rebuilt to benefit from +openssl+ support. You will either have to
>> +   do a full rebuild, or rebuild +ctorrent+ itself.
>
> This is an unrelated fix. Please submit in a separate patch.

Sure.

>
> baruch

thanks for your review,
-- 
Emeric
