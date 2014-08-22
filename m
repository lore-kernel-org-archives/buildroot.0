From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date: Fri, 22 Aug 2014 16:24:15 +0200
Subject: [Buildroot] [PATCH v2 3/6] gendoc infra: avoid a2x warning
In-Reply-To: <1408652748-14708-4-git-send-email-s.martin49@gmail.com>
References: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
 <1408652748-14708-4-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LWUJG=DMHtkOaRvdH6TXwsSk+ut-YmgCsTKfCuE9b+KTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Thu, Aug 21, 2014 at 10:25 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Though the --destination-dir option works as expected, a2x displays the
> following message when generating the pdf and text manual:
>
>   a2x: WARNING: --destination-dir option is only applicable to HTML based outputs
>
> To avoid this warning, we now just build the manual in its build location,
> then move the generated files into $(O)/docs/manual.

What you are saying is that even though there is a warning, the option
--destination-dir is taken into account even for non-HTML based
outputs?
In that case, is it not more logical to fix the issue in a2x and
ignore the warning for now?

Besides this general comment, see below if we pursue this patch anyway...

>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> changes v1 -> v2:
> - remove remaining '-D $$(@D)' arguments in the a2x command line
> ---
>  docs/manual/manual.mk | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 044557d..42d22be 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -70,6 +70,19 @@ ifneq ($$(wildcard $$(MANUAL_$(2)_ASCIIDOC_CONF)),)
>  MANUAL_$(2)_ASCIIDOC_OPTS += -f $$(MANUAL_$(2)_ASCIIDOC_CONF)
>  endif
>
> +# Handle a2x warning about --destination-dir option only applicable to HTML
> +# based outputs. So:
> +# - use the --destination-dir option if possible (html and split-html),
> +# - otherwise copy the generated manual to the output directory
> +MANUAL_$(2)_A2X_OPTS =

Why do you do this? The variable will be empty by default.

> +ifneq ($$(filter $(3),html split-html),)
> +MANUAL_$(2)_A2X_OPTS += --destination-dir="$$(@D)"
> +else
> +define MANUAL_$(2)_INSTALL_CMDS
> +       $$(Q)cp -f $$(BUILD_DIR)/$(1)/$(1).$(4) $$(@D)
> +endef

Is it really needed to have this dual approach?
The patch would be simpler if we just use the manual install, even for
html manuals.


Best regards,
Thomas
