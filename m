From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 25 Nov 2014 11:42:29 +0100
Subject: [Buildroot] [PATCH v4 next 0/5]  Improve silent builds
In-Reply-To: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <6658443.V0IJTQaiAA@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

If you are interested to keep quiet builds, you may be interested by
a tool called "reredirect"[1]. 

reredirect allows to redirect outputs of a running program. I use
it to redirect output of make process (and its children) to log files
(eg. build/busybox-1.22.1/busybox_extract.log, 
build/busybox-1.22.1/busybox_build.log, etc...).

To do this, I add this snippet in my local.mk :

define buildlog-silent
        $(call MESSAGE,$(2))
        if [ $(1) == start ]; then                                             \
                reredirect -m $(@D)/$(3)_$(2).log $$PPID > $(BUILD_DIR)/restore_$$PPID.cmd; \
        else                                                                   \
                sh $(BUILD_DIR)/restore_$$PPID.cmd;                            \
                rm $(BUILD_DIR)/restore_$$PPID.cmd;                            \
        fi
endef
GLOBAL_INSTRUMENTATION_HOOKS += buildlog-silent


With that, my build only display steps names and all build output is
redirected to log files. I have also a more complex snippet to redirect
output to log file and to console. In this case, I use a fifo and "tee"
in add of "reredirect".


Note 1: You may have to disable ptrace_scope in order to make reredirect work:
   echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope    


[1] https://github.com/jerome-pouiller/reredirect


On Monday 24 November 2014 14:56:57 Fabio Porcedda wrote:
> This patch set improves silent builds.
> 
> Silent builds are nice when top-level parallel make is being used to
> reduce the output clutter.
> 
> The change logs are in each patch.
> 
> Best regards
> Fabio Porcedda (5):
>   support/download: silence git if it is a silent build
>   support/download: silence svn if it is a silent build
>   support/download: pass the quiet flag to the hg download helper
>   support/download: pass the quiet flag to the wget download helper
>   support/download: pass the quiet flag to the scp download helper
> 
>  package/pkg-download.mk | 21 +++++++++++++--------
>  support/download/git    | 14 ++++++++++----
>  support/download/hg     |  5 +++--
>  support/download/scp    |  3 ++-
>  support/download/svn    |  4 +++-
>  support/download/wget   |  3 ++-
>  6 files changed, 33 insertions(+), 17 deletions(-)

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
