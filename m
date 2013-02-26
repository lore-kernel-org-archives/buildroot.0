From: Richard Braun <rbraun@sceen.net>
Date: Tue, 26 Feb 2013 08:43:32 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: new package
In-Reply-To: <CANxTyt5ROnfpwLwwoTkN+jJBmjWdubXKy9Pc4TCiiz1nMJnaaQ@mail.gmail.com>
References: <cover.1360017945.git.yann.morin.1998@free.fr>
 <3b37bfde822cb775f4f21b49052444442585fe26.1360017945.git.yann.morin.1998@free.fr>
 <CANxTyt5ROnfpwLwwoTkN+jJBmjWdubXKy9Pc4TCiiz1nMJnaaQ@mail.gmail.com>
Message-ID: <20130226074332.GA22882@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 25, 2013 at 09:02:50PM -0500, Danomi Manchego wrote:
> +define TZDATA_INSTALL_TARGET_CMDS
> +       mkdir -p $(TARGET_DIR)/usr/share/zoneinfo
> +       cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
> +       cd $(TARGET_DIR)/usr/share/zoneinfo;    \
> +       for zone in posix/*; do                 \
> +           ln -s "$${zone}" "$${zone##*/}";    \
> +       done
> +endef
> 
> Yann,
> 
> Today, a co-worker applied these patches, and ran into a small problem
> during the install phase.  He had made a mistake while applying the
> companion zic patch, which caused the tzdata package to stop.  Then,
> after he fixed his mistake, the tzdata failed to install, because the
> 'ln -s' failed to overwrite symlinks that already exist.  So I think
> that it might be good to add an 'rm -f "$${zone##*/}";' before the 'ln
> -s'.  (Or at least make it an 'ln -sf', though I personally am
> distrustful of 'ln -sf' due to sometimes unexpected behavior when the
> target of the symlink is a directory.)

This is best fixed with ln -sfn. Sorry for not doing it in the first
place.

-- 
Richard Braun
