From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Aug 2013 14:27:59 +0200
Subject: [Buildroot] [PATCH v2 1/2] getty: Create specific getty config
 + cleanups
In-Reply-To: <CAAXf6LV4mAJ77obaOx_7O9Dk_=a9oFGrW8QcFoAzdAKThAqjLA@mail.gmail.com>
References: <1377429219-25140-1-git-send-email-shmuelzon@gmail.com>
 <CAAXf6LV4mAJ77obaOx_7O9Dk_=a9oFGrW8QcFoAzdAKThAqjLA@mail.gmail.com>
Message-ID: <521C9B4F.4000300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/27/13 12:33, Thomas De Schampheleire wrote:
>> >+TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
>> >+TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
>> >+TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
>> >+TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
>> >+TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
>> >+TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
>> >+TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
>> >+TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
> Although in general = is favored over := in buildroot, I'm now
> wondering if this is the right choice here: variable
> TARGET_GENERIC_GETTY_PORT is used several times in .mk. If = is used,
> the qstrip expansion is done each time, while := will do it once.

  Remember that := will expand once, even if it is never used. So using = 
is sometimes even more efficient.


> Arnout: isn't this ($(call), $(shell), ...) a case where we should
> rather use := iso = ?

  For $(shell), yes (on condition that it is _always_ evaluated). But the 
overhead of $(call) isn't very high. These variables are used a couple of 
times, but every time it is within a separate sub-shell - the overhead of 
starting that sub-shell is way higher than the overhead of running a $(call).

  So no, this is not a case where := would be more appropriate. It's not 
even a case where := is necessarily faster.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
