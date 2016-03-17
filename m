From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 17 Mar 2016 13:32:46 +0300
Subject: [Buildroot] [PATCH 05/16] uclibc: disable DOPIC on ARM noMMU
In-Reply-To: <20160317090648.3900c10a@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9E791.3090104@mind.be>
 <20160317090648.3900c10a@free-electrons.com>
Message-ID: <CAMo8BfK66_TVGbJo=4TBmXATSX=7axE1+=Xj9Q1vdTBCdJUG0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 17, 2016 at 11:06 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 17 Mar 2016 00:09:05 +0100, Arnout Vandecappelle wrote:
>
>> > +ifeq ($(UCLIBC_TARGET_ARCH),arm)
>> > +ifeq ($(BR2_USE_MMU),)
>>
>>   If elf2flt is the issue, wouldn't it make more sense to check for BINFMT_FLAT?
>
> OK. At this point, on ARM BR2_USE_MMU disabled or BINFMT_FLAT=y is
> equivalent. But right, it's a elf2flt related issue, so testing
> BINFMT_FLAT makes more sense.
>
>>   Also, is it really only for arm that this issue exists? Custom xtensa is the
>> only other one for which we build an internal toolchain, but I don't know if
>> anybody ever tests it...
>
> I have no idea if Xtensa noMMU has ever been tested, whether it uses
> FLAT or FDPIC, etc. Could we leave this up to people interested in
> Xtensa ? Or alternatively, remove noMMU Xtensa support altogether.
>
> I'm Cc'ing Max to see if he knows what the status of noMMU Xtensa is.

I tested noMMU xtensa lightly. It uses FLAT
( https://github.com/uclinux-dev/elf2flt/commit/052ec62c087a3e9dfb62d231ee4aad253bce2f7e
),
requires a patch for gcc
( https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e3c15dbe1c4cd63d906eb67c1c607cc4fab6b329
),
and currently it defaults to generating PIC code.
It appears to work with both DOPIC enabled and disabled.

-- 
Thanks.
-- Max
