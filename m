Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE81AC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DF2D84988;
	Sat, 23 Jul 2022 21:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF2D84988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPiRGnIoK82l; Sat, 23 Jul 2022 21:28:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A7AB84963;
	Sat, 23 Jul 2022 21:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7AB84963
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1C2B1BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAA1542493
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA1542493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWvLwWMDEz9n for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:28:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C8342490
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85C8342490
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:28:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v13so3122898wru.12
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hN+WJmG1R4ZZmXuP5Gg1blNV7gx+NhV+SFVTC7TfodU=;
 b=7J0eu5LrOiSsIJUaKw5S6/Pb+nS/QsyUWYlnHwXz4xqv53IQlxmbYlAO8mFteUXkE4
 X87OkWGyGXSCoyAbjujf+5IP5f85DmM4OJkNEY0lXGYHvoNRbX9ayS4xol/mz5sxGQ6M
 XTj+giISNdgHe8R2hCoEOdth4iBKqpSdarbDyLTrvrgU8Dw1pky2a87DNT2ZYolR0EN/
 rKAiUdyIhG/0CD/ViClItmCJ7FwWPylXtUIMG0ffxurS7vMkd7H9N2zVgKejqtpNqd6I
 Ef+bJCDSJxVvwKZD/bb4g2rLMpmZENhOOpqvGaVXl//fD2DAGXq7v3o2p+xBm+nXquGm
 9t1g==
X-Gm-Message-State: AJIora/wjmsz8Tco8pItIkWM4DYj47T5EIA1kb0R9vzl5A+Z7yTvQ0dI
 E9qtdZutLFWcomgeEMmcJTfiYQ==
X-Google-Smtp-Source: AGRyM1vjlL37sKqs75n3vOou7oIguAVTAg++BxxhgA2XZZePXB8nPZhSoIyu2LNuYuUrVkw/ZkX1Hg==
X-Received: by 2002:a5d:4dc8:0:b0:21e:660f:8dfe with SMTP id
 f8-20020a5d4dc8000000b0021e660f8dfemr3580704wru.468.1658611731315; 
 Sat, 23 Jul 2022 14:28:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5301000000b0021e5b5a68f8sm7963143wrv.45.2022.07.23.14.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 14:28:50 -0700 (PDT)
Message-ID: <8581ea46-4f5f-b56a-c60b-d1f0b6ad95e1@mind.be>
Date: Sat, 23 Jul 2022 23:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
References: <20211011220025.7998-1-petr.vorel@gmail.com>
 <20211011220025.7998-2-petr.vorel@gmail.com> <20211111080014.GR2084998@scaer>
 <YY7iy2xQUcMBPqsx@pevik>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <YY7iy2xQUcMBPqsx@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hN+WJmG1R4ZZmXuP5Gg1blNV7gx+NhV+SFVTC7TfodU=;
 b=W4f6jYOsT1+GHnx6fQbFOO/I8p4Mzbm0iFbezV+rWix6vxJJog35+7nT7PFOsXUKUW
 cX5xvBF7AnW7lKLjKqBuiT1hM5bkD36RRIbGCL71dwBmTCIf961M8MQVWFVAAhvPdlYB
 UML2E1fltsTUjiU0RM7yJNNGYK0J7CBgH4rrzaFK/xLCufqHJta+WGOuZpcHaYScz6dg
 mFyacT9cwAEG6hGGqcDnbq5JHFjY5zp/ArJ7BuZmgaxMJDFlu6bZvsRpa+VHaRzesPb6
 n/rIPPV4gSy+5SgFT2L53S/qgRrfXUjix7z4zSg7w/D9MywSIz4Tdo5Tb25/Lwv/DzkM
 ecjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W4f6jYOs
Subject: Re: [Buildroot] [RFC PATCH 1/3] make: support: use `command -v'
 instead of `which'
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Markus Mayer <mmayer@broadcom.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/11/2021 22:55, Petr Vorel wrote:
> Hi Yann,
> 
>> Petr, All,
> 
>> On 2021-10-12 00:00 +0200, Petr Vorel spake thusly:
>>> `which' has been discontinued after 2.21 release in 2015 due this (git
>>> repository is empty [1]) and version shipped in Debian produces warning
>>> [2]:
> 
>>> /usr/bin/which: this version of `which' is deprecated; use `command -v' in scripts instead.
> 
>> In the meantime, this is supposed to have been overrdien by the
>> technical committee:
> 
>>      https://lwn.net/ml/debian-ctte/handler.994275.D994275.163536015027825.ackdone@bugs.debian.org/
> Yep, I've noticed this on LWN as well.
> 
>> Excerpt:
> 
>>   --8<---
>>   1. The debianutils package must continue to provide the which(1) program
>>      until a compatible utility is available in a package that is at least
>>      transitively essential in Debian 12.
> 
>>      For the Debian 12 release, we expect which(1) to be in either an
>>      Essential package or a transitively Essential package (that is, a
>>      package that is depended on by an Essential package).
> 
>>   2. The which(1) program must not print any deprecation warnings.
>>   --8<---
> 
>> As such, the situation is a calmer for now and is less urgent, and we
>> can address it for after 2021.11 (given that Debian 11 was released only
>> 3 months ago, we have a bit of time ahead of us before Debian 12 finally
>> ships! ;-] )
> 
> Well, some people use Debian testing :). But sure, it was never urgent,
> the issue does not break build. This time I'm quite confident it works,
> but one revert was enough => it can wait till more people find time to test it.

  In the end, it got reverted in debian testing as well, so we can drop this 
series (for now). I've marked them as Rejected in patchwork.

  Regards,
  Arnout

> 
> Kind regards,
> Petr
> 
>> Regards,
>> Yann E. MORIN.
> 
>>> `command is POSIX [3] and supported on all common shells (bash, zsh,
>>> dash, busybox sh, mksh).
> 
>>> NOTE: originally merged as ca6a2907c2, but it had to be reverted due
>>> errors [4] (originally reported [5]). Problems were:
> 
>>> 1) Main problem was that make sometimes expected `command' as a
>>>     binary/script and run it with execve() (or any other exec*()
>>>     wrapper), instead of running it through a shell via system() [4]:
> 
>>>      $ make defconfig
>>>      [...]
>>>      $ make help
>>>      make[1]: command: Command not found
>>>      [...]
> 
>>>     Fixed by not relying to $(shell command -v ...) but shell with:
>>>     $(shell $(SHELL) -c "command -v ...").
> 
>>> 2) `command -v' handles only first parameter (unlike `which') [4].
>>>     Hopefully fixed with quoting variables. Quoting variables is also
>>>     needed, because both `command -v' without args and `type -p' exit 0.
> 
>>> Patch tested on both bash and dash as /bin/sh on various distros with
>>> having different make versions, including these previously affected
>>> (4.2.1, 4.0, 3.81).
> 
>>> [1] https://git.savannah.gnu.org/cgit/which.git
>>> [2] https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c13ce23fc9da7efb
>>> [3] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html
>>> [4] https://lore.kernel.org/buildroot/20210930200402.GO1504958@scaer/
>>> [5] https://lore.kernel.org/buildroot/YVTIghzHs82uFBIe@pevik/T/#m95c17eb8374e4e3dd6eee700d397aa12cca0739e
> 
>>> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>>> ---
>>>   Makefile                                      | 22 +++++++++----------
>>>   package/Makefile.in                           |  8 +++----
>>>   support/dependencies/check-host-bison-flex.mk |  4 ++--
>>>   support/dependencies/check-host-cmake.sh      |  2 +-
>>>   support/dependencies/check-host-gzip.sh       |  2 +-
>>>   support/dependencies/check-host-lzip.sh       |  4 ++--
>>>   support/dependencies/check-host-python3.sh    |  2 +-
>>>   support/dependencies/check-host-tar.sh        |  4 ++--
>>>   support/dependencies/check-host-xzcat.sh      |  4 ++--
>>>   support/dependencies/dependencies.sh          | 16 +++++++-------
>>>   .../pkg-toolchain-external.mk                 |  2 +-
>>>   11 files changed, 35 insertions(+), 35 deletions(-)
> 
>>> diff --git a/Makefile b/Makefile
>>> index c960b53a6d..2317655272 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -284,12 +284,12 @@ HOSTAS := as
>>>   endif
>>>   ifndef HOSTCC
>>>   HOSTCC := gcc
>>> -HOSTCC := $(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
>>> +HOSTCC := $(shell $(SHELL) -c "command -v '$(HOSTCC)' || type -p '$(HOSTCC)' || echo gcc")
>>>   endif
>>>   HOSTCC_NOCCACHE := $(HOSTCC)
>>>   ifndef HOSTCXX
>>>   HOSTCXX := g++
>>> -HOSTCXX := $(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
>>> +HOSTCXX := $(shell $(SHELL) -c "command -v '$(HOSTCXX)' || type -p '$(HOSTCXX)' || echo g++")
>>>   endif
>>>   HOSTCXX_NOCCACHE := $(HOSTCXX)
>>>   ifndef HOSTCPP
>>> @@ -310,15 +310,15 @@ endif
>>>   ifndef HOSTRANLIB
>>>   HOSTRANLIB := ranlib
>>>   endif
>>> -HOSTAR := $(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
>>> -HOSTAS := $(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
>>> -HOSTCPP := $(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
>>> -HOSTLD := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
>>> -HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
>>> -HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
>>> -HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
>>> -HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
>>> -SED := $(shell which sed || type -p sed) -i -e
>>> +HOSTAR := $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || type -p '$(HOSTAR)' || echo ar")
>>> +HOSTAS := $(shell '$(SHELL)' -c "command -v '$(HOSTAS)' || type -p '$(HOSTAS)' || echo as")
>>> +HOSTCPP := $(shell '$(SHELL)' -c "command -v '$(HOSTCPP)' || type -p '$(HOSTCPP)' || echo cpp")
>>> +HOSTLD := $(shell '$(SHELL)' -c "command -v '$(HOSTLD)' || type -p '$(HOSTLD)' || echo ld")
>>> +HOSTLN := $(shell '$(SHELL)' -c "command -v '$(HOSTLN)' || type -p '$(HOSTLN)' || echo ln")
>>> +HOSTNM := $(shell '$(SHELL)' -c "command -v '$(HOSTNM)' || type -p '$(HOSTNM)' || echo nm")
>>> +HOSTOBJCOPY := $(shell '$(SHELL)' -c "command -v '$(HOSTOBJCOPY)' || type -p '$(HOSTOBJCOPY)' || echo objcopy")
>>> +HOSTRANLIB := $(shell '$(SHELL)' -c "command -v '$(HOSTRANLIB)' || type -p '$(HOSTRANLIB)' || echo ranlib")
>>> +SED := $(shell $(SHELL) -c "command -v sed || type -p sed") -i -e
> 
>>>   export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
>>>   export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
>>> diff --git a/package/Makefile.in b/package/Makefile.in
>>> index 86db62ba5b..2ba4d8b381 100644
>>> --- a/package/Makefile.in
>>> +++ b/package/Makefile.in
>>> @@ -4,7 +4,7 @@ endif
>>>   ifndef HOSTMAKE
>>>   HOSTMAKE = $(MAKE)
>>>   endif
>>> -HOSTMAKE := $(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
>>> +HOSTMAKE := $(shell $(SHELL) -c "command -v '$(HOSTMAKE)' || type -p '$(HOSTMAKE)' || echo make")
> 
>>>   # If BR2_JLEVEL is 0, scale the maximum concurrency with the number of
>>>   # CPUs. An additional job is used in order to keep processors busy
>>> @@ -222,8 +222,8 @@ else
>>>   TARGET_STRIP = /bin/true
>>>   STRIPCMD = $(TARGET_STRIP)
>>>   endif
>>> -INSTALL := $(shell which install || type -p install)
>>> -UNZIP := $(shell which unzip || type -p unzip) -q
>>> +INSTALL := $(shell $(SHELL) -c "command -v install || type -p install")
>>> +UNZIP := $(shell $(SHELL) -c "command -v unzip || type -p unzip") -q
> 
>>>   APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
> 
>>> @@ -237,7 +237,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
>>>   # the path to the system perl, before a host-perl built by Buildroot
>>>   # might get installed into $(HOST_DIR)/bin and therefore appears
>>>   # in our PATH. This system perl will be used as INTLTOOL_PERL.
>>> -export PERL=$(shell which perl)
>>> +export PERL=$(shell $(SHELL) -c "command -v perl")
> 
>>>   # host-intltool needs libxml-parser-perl, which Buildroot installs in
>>>   # $(HOST_DIR)/lib/perl, so we must make sure that the system perl
>>> diff --git a/support/dependencies/check-host-bison-flex.mk b/support/dependencies/check-host-bison-flex.mk
>>> index 14a232fd44..b6cec369f1 100644
>>> --- a/support/dependencies/check-host-bison-flex.mk
>>> +++ b/support/dependencies/check-host-bison-flex.mk
>>> @@ -5,10 +5,10 @@
>>>   # that runs on host, e.g. Kconfig. To build code for target use plain
>>>   # host-{bison,flex}.
> 
>>> -ifeq ($(shell which bison 2>/dev/null),)
>>> +ifeq ($(shell $(SHELL) -c "command -v bison 2>/dev/null"),)
>>>   BR2_BISON_HOST_DEPENDENCY = host-bison
>>>   endif
> 
>>> -ifeq ($(shell which flex 2>/dev/null),)
>>> +ifeq ($(shell $(SHELL) -c "command -v flex 2>/dev/null"),)
>>>   BR2_FLEX_HOST_DEPENDENCY = host-flex
>>>   endif
>>> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
>>> index fadeae9f6b..f202d72a98 100755
>>> --- a/support/dependencies/check-host-cmake.sh
>>> +++ b/support/dependencies/check-host-cmake.sh
>>> @@ -11,7 +11,7 @@ shift
>>>   for candidate; do
> 
>>>       # Try to locate the candidate. Discard it if not located.
>>> -    cmake=`which "${candidate}" 2>/dev/null`
>>> +    cmake=`command -v "${candidate}" 2>/dev/null`
>>>       [ -n "${cmake}" ] || continue
> 
>>>       # Extract version X.Y from versions in the form X.Y or X.Y.Z
>>> diff --git a/support/dependencies/check-host-gzip.sh b/support/dependencies/check-host-gzip.sh
>>> index 5f344c5f9b..4dbce72676 100755
>>> --- a/support/dependencies/check-host-gzip.sh
>>> +++ b/support/dependencies/check-host-gzip.sh
>>> @@ -2,7 +2,7 @@
> 
>>>   candidate="$1" # ignored
> 
>>> -gzip="$(which gzip)"
>>> +gzip="$(command -v gzip)"
>>>   if [ ! -x "${gzip}" ]; then
>>>       # echo nothing: no suitable gzip found
>>>       exit 1
>>> diff --git a/support/dependencies/check-host-lzip.sh b/support/dependencies/check-host-lzip.sh
>>> index 4f8a2ba3de..5cdfb8252a 100755
>>> --- a/support/dependencies/check-host-lzip.sh
>>> +++ b/support/dependencies/check-host-lzip.sh
>>> @@ -2,9 +2,9 @@
> 
>>>   candidate="$1"
> 
>>> -lzip=`which $candidate 2>/dev/null`
>>> +lzip=`command -v "$candidate" 2>/dev/null`
>>>   if [ ! -x "$lzip" ]; then
>>> -	lzip=`which lzip 2>/dev/null`
>>> +	lzip=`command -v lzip 2>/dev/null`
>>>   	if [ ! -x "$lzip" ]; then
>>>   		# echo nothing: no suitable lzip found
>>>   		exit 1
>>> diff --git a/support/dependencies/check-host-python3.sh b/support/dependencies/check-host-python3.sh
>>> index 17cafd2883..ca504da6ac 100755
>>> --- a/support/dependencies/check-host-python3.sh
>>> +++ b/support/dependencies/check-host-python3.sh
>>> @@ -14,7 +14,7 @@ shift
>>>   # a more recent version.
> 
>>>   for candidate in "${@}" ; do
>>> -	python3=`which $candidate 2>/dev/null`
>>> +	python3=`command -v "$candidate" 2>/dev/null`
>>>   	if [ ! -x "$python3" ]; then
>>>   		continue
>>>   	fi
>>> diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
>>> index b7d607a47a..0f0f80038d 100755
>>> --- a/support/dependencies/check-host-tar.sh
>>> +++ b/support/dependencies/check-host-tar.sh
>>> @@ -2,9 +2,9 @@
> 
>>>   candidate="$1"
> 
>>> -tar=`which $candidate`
>>> +tar=`command -v "$candidate"`
>>>   if [ ! -x "$tar" ]; then
>>> -	tar=`which tar`
>>> +	tar=`command -v tar`
>>>   	if [ ! -x "$tar" ]; then
>>>   		# echo nothing: no suitable tar found
>>>   		exit 1
>>> diff --git a/support/dependencies/check-host-xzcat.sh b/support/dependencies/check-host-xzcat.sh
>>> index 10f1c4562a..a022c64faf 100755
>>> --- a/support/dependencies/check-host-xzcat.sh
>>> +++ b/support/dependencies/check-host-xzcat.sh
>>> @@ -2,9 +2,9 @@
> 
>>>   candidate="$1"
> 
>>> -xzcat=`which $candidate 2>/dev/null`
>>> +xzcat=`command -v "$candidate" 2>/dev/null`
>>>   if [ ! -x "$xzcat" ]; then
>>> -	xzcat=`which xzcat 2>/dev/null`
>>> +	xzcat=`command -v xzcat 2>/dev/null`
>>>   	if [ ! -x "$xzcat" ]; then
>>>   		# echo nothing: no suitable xzcat found
>>>   		exit 1
>>> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
>>> index c604a9efcc..e720e9372e 100755
>>> --- a/support/dependencies/dependencies.sh
>>> +++ b/support/dependencies/dependencies.sh
>>> @@ -58,7 +58,7 @@ fi
>>>   check_prog_host()
>>>   {
>>>   	prog="$1"
>>> -	if ! which $prog > /dev/null ; then
>>> +	if ! command -v "$prog" > /dev/null ; then
>>>   		echo >&2
>>>   		echo "You must install '$prog' on your build machine" >&2
>>>   		exit 1
>>> @@ -75,7 +75,7 @@ check_prog_host "sed"
>>>   check_prog_host "/usr/bin/file"
> 
>>>   # Check make
>>> -MAKE=$(which make 2> /dev/null)
>>> +MAKE=$(command -v make 2> /dev/null)
>>>   if [ -z "$MAKE" ] ; then
>>>   	echo
>>>   	echo "You must install 'make' on your build machine";
>>> @@ -96,9 +96,9 @@ if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
>>>   fi;
> 
>>>   # Check host gcc
>>> -COMPILER=$(which $HOSTCC_NOCCACHE 2> /dev/null)
>>> +COMPILER=$(command -v "$HOSTCC_NOCCACHE" 2> /dev/null)
>>>   if [ -z "$COMPILER" ] ; then
>>> -	COMPILER=$(which cc 2> /dev/null)
>>> +	COMPILER=$(command -v cc 2> /dev/null)
>>>   fi;
>>>   if [ -z "$COMPILER" ] ; then
>>>   	echo
>>> @@ -122,9 +122,9 @@ if [ $COMPILER_MAJOR -lt 4 -o $COMPILER_MAJOR -eq 4 -a $COMPILER_MINOR -lt 8 ] ;
>>>   fi;
> 
>>>   # check for host CXX
>>> -CXXCOMPILER=$(which $HOSTCXX_NOCCACHE 2> /dev/null)
>>> +CXXCOMPILER=$(command -v "$HOSTCXX_NOCCACHE" 2> /dev/null)
>>>   if [ -z "$CXXCOMPILER" ] ; then
>>> -	CXXCOMPILER=$(which c++ 2> /dev/null)
>>> +	CXXCOMPILER=$(command -v c++ 2> /dev/null)
>>>   fi
> 
>>>   if [ -z "$CXXCOMPILER" ] ; then
>>> @@ -164,7 +164,7 @@ fi
>>>   # Check that a few mandatory programs are installed
>>>   missing_progs="no"
>>>   for prog in perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
>>> -	if ! which $prog > /dev/null ; then
>>> +	if ! command -v "$prog" > /dev/null ; then
>>>   		echo "You must install '$prog' on your build machine";
>>>   		missing_progs="yes"
>>>   		if test $prog = "svn" ; then
>>> @@ -198,7 +198,7 @@ if [ "${PATCH_MAJOR}" -lt 2 ] || [ "${PATCH_MAJOR}" -eq 2 -a "${PATCH_MINOR}" -l
>>>   fi
> 
>>>   if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
>>> -	if ! which locale > /dev/null ; then
>>> +	if ! command -v locale > /dev/null ; then
>>>   		echo
>>>   		echo "You need locale support on your build machine to build a toolchain supporting locales"
>>>   		exit 1 ;
>>> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
>>> index 68d7a3fe21..2d9d9a5d49 100644
>>> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
>>> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
>>> @@ -74,7 +74,7 @@ endif
>>>   ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
>>>   ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
>>>   # if no path set, figure it out from path
>>> -TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
>>> +TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell $(SHELL) -c "command -v '$(TOOLCHAIN_EXTERNAL_PREFIX)-gcc)'")
>>>   endif
>>>   else
>>>   TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH))
>>> -- 
>>> 2.33.0
> 
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
