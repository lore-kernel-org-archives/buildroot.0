From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 8 Jul 2019 21:15:48 -0500
Subject: [Buildroot] [RFC] BR2_EXTERNAL linux-kernel-extensions support
In-Reply-To: <20190709005820.595-1-robert.mccabe@rockwellcollins.com>
References: <20190709005820.595-1-robert.mccabe@rockwellcollins.com>
Message-ID: <CANQCQpbobC6KV9fNwUw3gzUonzsW+W5E9EjYNnMmmoJ9bVRQHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rob,

On Mon, Jul 8, 2019 at 7:58 PM <robert.mccabe@rockwellcollins.com> wrote:
>
> From: "McCabe, Robert J" <robert.mccabe@rockwellcollins.com>
>
> Allows external projects to inject custom code inside the Linux source
> tree.
>
> Although a simple change that *shouldn't* be controversial I'm troubled
> by the comment a few lines above:
>
>    #However, since the files we include here are in the same directory as
>    #the current Makefile, we are OK. But this is a hard requirement: files
>    #included here *must* be in the same directory!
>
> I'm not seeing why this is a "hard requirement" ...

There was some discussion on a similar thread earlier this year. (I
added Ryan Barnett as we had similar interest in converting our
internal linux extension over to the upstream approach.)
http://buildroot-busybox.2317881.n4.nabble.com/Linux-extension-from-a-BR2-EXTERNAL-tree-td214834.html#a214845


>
> Signed-off-by: McCabe, Robert J <robert.mccabe@rockwellcollins.com>
> ---
>  linux/linux.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 2b5d096e14..af3de401d1 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -514,6 +514,12 @@ endef
>  # included here *must* be in the same directory!
>  include $(sort $(wildcard linux/linux-ext-*.mk))
>
> +define INCLUDE_EXTERNAL_LINUX_EXTENSIONS
> +-include $(sort $(wildcard $(1)/linux/linux-ext-*.mk))
> +endef
> +$(foreach ext,$(BR2_EXTERNAL_DIRS), \
> +       $(eval $(call INCLUDE_EXTERNAL_LINUX_EXTENSIONS,$(ext))))
> +
>  LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
>         $(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
>
> --
> 2.17.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
