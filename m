From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Aug 2015 19:19:00 +0200
Subject: [Buildroot] [PATCHv2] docs/manual: fix generation of deprecated
 list
In-Reply-To: <1438525927-29714-1-git-send-email-yann.morin.1998@free.fr>
References: <1438525927-29714-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150802191900.09495bd7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  2 Aug 2015 16:32:07 +0200, Yann E. MORIN wrote:
> Since commit 5f117c3 (webkit: mark as deprecated), generation of the
> manual has been broken.
> 
> This is because that commit added a deprecated dependency on a
> prompt-less symbol, BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS. However, the
> generation script does not check that a symbol has a prompt before
> it attempts to add it to the deprecated list. So, we end up with
> traceback:
> 
>     Writing the virtual-packages list in:
>             /home/ymorin/dev/buildroot/O/build/docs/manual/virtual-package-list.txt
>     Traceback (most recent call last):
>       File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 510, in <module>
>         buildroot.print_list(list_name, dry_run=args.dry_run, output=output)
>       File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 466, in print_list
>         item_label=item_label)
>       File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 126, in format_asciidoc_table
>         enable_choice=enable_choice))
>       File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 350, in _format_symbol_prompt_location
>         return "| {0:<40} <| {1}\n".format(get_label_func(symbol),
>       File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 458, in <lambda>
>         get_label = lambda x: self._get_symbol_label(x, mark_depr)
>       File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 313, in _get_symbol_label
>         label = symbol.get_prompts()[0]
>     IndexError: list index out of range
> 
> However, we can not use the existing _is_deprecated filter function to
> filter out symbols without prompts, because this function is also used
> to add a '(deprecated)' tag in the man package list (not that it would
> not work, but it does not seem /right/). Furthermore, it could also be
> used (but is currently not) to build the list of virtual packages, which
> do not have a prompt.
> 
> So, introduce a filter function, aptly named _is_deprecated_feature(),
> to be used as the filter to find deprecated feature, and keep the
> existing _is_deprecated() that can be used in any context to decide
> whether a symbol is deprecated or not.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> ---
> Thomas, you're in copy because it might be interesting to get the
> autobuilders build the manual from time to time, no?

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
