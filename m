From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 13:53:32 +0100
Subject: [Buildroot] [PATCH 2/5] When using python3 a symlink "python"
 is added in staging and point to python3. This is needed to call python
 setup for external package. A second simlink is added to alias the
 config-3.3m directory to config
In-Reply-To: <1360671849-7621-3-git-send-email-kpa_info@yahoo.fr>
References: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
 <1360671849-7621-3-git-send-email-kpa_info@yahoo.fr>
Message-ID: <20130212135332.77afcc3b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick Gerber,

Please fix your git commit log. The first line of a git commit log
becomes the title of the e-mails, so it should have a length no longer
than 80-100 characters. After this first line, leave an empty new line,
and add more details for your commit log.

On Tue, 12 Feb 2013 13:24:06 +0100, Patrick Gerber wrote:
> 
> Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
> ---
>  package/python3/python3.mk |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 7551a7b..5974824 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -160,6 +160,14 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
>  PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
>  endif
>  
> +define HOST_PYTHON3_INSTALL_SYMLINK
> +	ln -fs python3 $(HOST_DIR)/usr/bin/python
> +	ln -fs config-3.3m $(HOST_DIR)/usr/lib/python3.3/config
> +endef
> +
> +HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK

As Samuel pointed it out, this unfortunately may break a number of
things in Buildroot. They are packages that depend on host-python, and
would only be capable of using an Python 2.x host-python.

Or at least, I would like to have the confirmation that all packages
that depend on host-python continue to build normally when host-python
is Python 3.

That said, some packages are not really clear about this. For example,
Scons uses the Python provided with the distribution, and not the
host-python built by Buildroot.

As you can see, this is not a trivial topic.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
