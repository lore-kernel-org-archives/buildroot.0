From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:00:31 +0100
Subject: [Buildroot] [PATCH 02/16] package: install bash-completion
 files only with bash
In-Reply-To: <1421684056-5266-3-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-3-git-send-email-maxtram95@gmail.com>
Message-ID: <20150126230031.7b1d0c97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:02 +0200, Maxim Mikityanskiy wrote:
> package/systemd, package/kmod, package/util-linux: don't install
> bash-completion files if bash is not selected to be installed.
> Otherwise, install bash-completion files.
> 
> package/systemd: don't install zsh-completion files is zsh is not
> selected to be installed. Otherwise, install zsh-completion files.
> 
> package/util-linux: don't install empty
> /usr/share/bash-completion/completions directory if bash is not going to
> be installed, and install bash-completion files if bash is selected to
> be installed.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Thanks, applied.

However, long term I wonder if we shouldn't think of a more centralized
and radical solution. In package/bash/bash.mk:

ifeq ($(BR2_PACKAGE_BASH),)
define BASH_REMOVE_COMPLETION_FILES
	$(RM) -rf $(TARGET_DIR)/usr/share/bash-completion/
endef
TARGET_FINALIZE_HOOKS += BASH_REMOVE_COMPLETION_FILES
endif

This way, as long as bash is not enabled, all bash completion files are
removed. We could do the same with zsh.

The only trick here is that such a solution relies on
package/bash/bash.mk being included/parsed unconditionally. This is
currently the case today: regardless of whether a package is enabled or
not, its .mk file is always included/parsed. But at some point in the
past, we have been talking on changing this, in order to speed up the
parsing time of all the .mk files, which linearly increases with the
number of packages we add in Buildroot. But oh well, if we ever want to
do that, we can always change the way to handle the bash completion
thing, and other similar target finalization stuff that needs to be
done if a package is *not* installed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
