From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 12 Apr 2020 22:00:12 +0200
Subject: [Buildroot] [PATCH v5 0/5] gitlab Qemu runtime testing
In-Reply-To: <20200412161155.51b6bc98@windsurf.home>
References: <20200217205030.8157-1-romain.naour@smile.fr>
 <20200412161155.51b6bc98@windsurf.home>
Message-ID: <4d0d3fe8-0123-7b00-0617-2dbcfed2e424@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 12/04/2020 ? 16:11, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Mon, 17 Feb 2020 21:50:25 +0100
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> Jugurtha BELKALEM (2):
>>   support/scripts/boot-qemu-image.py: boot Qemu images with Qemu-system.
>>   gitlab.yml.in*: enable Qemu gitlab testing
>>
>> Romain Naour (3):
>>   board/qemu: add defconfig file name as tag after the qemu command line
>>   board/qemu: add post-image script for gitlab qemu testing
>>   configs/qemu*: use the post-image script with "$(BR2_DEFCONFIG)" as
>>     argument.
> 
> Overall, I am quite happy with the series. There are just two things
> that I am not entirely sure about:
> 
>  (1) The logic that tests $CI_JOB_NAME in board/qemu/post-image.sh, to
>      test if we are running under Gitlab CI or not. It feels a bit
>      hackish to me. Should this magic be there, or instead tweaked by
>      the Gitlab CI testing stuff directly ?

True, this is how it's done in toolchain-builder project. But the goal here is
to provide the start-qemu.sh script at the end of the build, even outside of
Gitlab CI.

> 
>  (2) We now generate this start-qemu.sh script in $(BINARIES_DIR), but
>      in fact only really use it for Gitlab CI testing. Should we make
>      this start-qemu.sh script more prominently useful ? Or should we
>      instead not have any start-qemu.sh script, and have the Gitlab CI
>      testing logic directly find what the Qemu command line should be ?

start-qemu.sh can be used outside of Gitlab CI, I'm regularly using Qemu
defconfig locally and getting the qemu command line from the readme is not
practical. That was the feedback I had from one user on previous iteration.

> 
> That being said, this series has been around for a long time, so unless
> I get some feedback on these questions, I'm going to apply it as-is, we
> can always improve on top of that later on.

This series was started by my colleague Jugurtha about one year ago. Since then
toolchains update showed that Qemu runtime testing is necessary otherwise we can
end up with a non working defconfig (see issue with binutils 2.34 and sh4 kernel).

http://patchwork.ozlabs.org/patch/1216434/

Thanks Yann for the review during the last Buildroot meeting!

Best regards,
Romain


> 
> Best regards,
> 
> Thomas
> 
