From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 1 Dec 2014 18:51:28 +0100
Subject: [Buildroot] [PATCH v4 next 0/5] Improve silent builds
In-Reply-To: <6658443.V0IJTQaiAA@aquila>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
 <6658443.V0IJTQaiAA@aquila>
Message-ID: <CAHkwnC9B8ndR6hyzejBMzia7EfYo3BedpYM7CRhL4d_71grudA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 25, 2014 at 11:42 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Hello Fabio,
>
> If you are interested to keep quiet builds, you may be interested by
> a tool called "reredirect"[1].
>
> reredirect allows to redirect outputs of a running program. I use
> it to redirect output of make process (and its children) to log files
> (eg. build/busybox-1.22.1/busybox_extract.log,
> build/busybox-1.22.1/busybox_build.log, etc...).
>
> To do this, I add this snippet in my local.mk :
>
> define buildlog-silent
>         $(call MESSAGE,$(2))
>         if [ $(1) == start ]; then                                             \
>                 reredirect -m $(@D)/$(3)_$(2).log $$PPID > $(BUILD_DIR)/restore_$$PPID.cmd; \
>         else                                                                   \
>                 sh $(BUILD_DIR)/restore_$$PPID.cmd;                            \
>                 rm $(BUILD_DIR)/restore_$$PPID.cmd;                            \
>         fi
> endef
> GLOBAL_INSTRUMENTATION_HOOKS += buildlog-silent
>
>
> With that, my build only display steps names and all build output is
> redirected to log files. I have also a more complex snippet to redirect
> output to log file and to console. In this case, I use a fifo and "tee"
> in add of "reredirect".
>
>
> Note 1: You may have to disable ptrace_scope in order to make reredirect work:
>    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
>
>
> [1] https://github.com/jerome-pouiller/reredirect

Nice tool, thanks for letting me know about it.

BR
-- 
Fabio Porcedda
