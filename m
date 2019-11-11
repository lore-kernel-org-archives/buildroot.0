From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 11 Nov 2019 22:13:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/ninja: invoke python3
 explicitly to configure the package
In-Reply-To: <20191111200401.16924-1-avraham.shukron@gmail.com>
References: <20191111200401.16924-1-avraham.shukron@gmail.com>
Message-ID: <CALFsTFUeGv84EQhxWbFF=beVOr3Bgcwt-SZHQ=GVafK=QsATLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Nov 11, 2019 at 10:04 PM Avi Shukron <avraham.shukron@gmail.com> wrote:
>
> ninja depends on python3 specifically, but the configure.py file
> simply uses "env python". Where no python is selected for the target
> you simply won't get a python symlink in $(HOST_DIR)/usr/bin, so the
> configure.py script fails to run since it can't find "python".
>
> Notice that in order to reproduce the issue, you must not have
> python2 installed on your host machine.
>
> Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
> ---
>  package/ninja/ninja.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
> index 4897012150..867b92c4c3 100644
> --- a/package/ninja/ninja.mk
> +++ b/package/ninja/ninja.mk
> @@ -17,7 +17,7 @@ NINJA_LICENSE_FILES = COPYING
>  HOST_NINJA_DEPENDENCIES = host-python3
>
>  define HOST_NINJA_BUILD_CMDS
> -       (cd $(@D); ./configure.py --bootstrap)
> +       (cd $(@D); $(HOST_DIR)/bin/python3 ./configure.py --bootstrap)

Well, I guess you can now remove the "./" before configure.py
as now you explicitly call python3 before it.

>  endef
>
>  define HOST_NINJA_INSTALL_CMDS
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Asaf.
