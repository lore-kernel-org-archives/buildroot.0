From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 16:33:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: Add naxsi module option.
In-Reply-To: <1468259776-26584-1-git-send-email-aduskett@codeblue.com>
References: <1468259776-26584-1-git-send-email-aduskett@codeblue.com>
Message-ID: <20160712163312.32b1157e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 13:56:16 -0400, Adam Duskett wrote:
> Naxsi is a third party nginx module reads a small subset of simple rules
> containing a list of known patterns involved in website vulnerabilities.
> This module behaves like a DROP-by-default firewall for nginx.
> 
> The reason for the changes to the make file was because naxsi is listed
> on github, and even though there is a option to specify a url for a 3rd party
> module, this option only seems to work for a local file url.  As such
> a EXTRA_DOWNLOADS and POST_EXTRACT_HOOKS was added to the makefile
> so that the module is first downloaded and then extracted into the
> nginx source directory, and then the module source is added to the
> config options.  This was the cleanest solution I could find, if anybody
> thinks of a cleaner solution please let me know.
> 
> The hash for the module was also added to nginx.hash.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

Thanks for this patch. I had a look at this nginx thing, and indeed
building third-party modules is annoying, as they can only be built as
part of the nginx build process. I.e you cannot build nginx, and then
later on build additional third-party extensions.

However, I don't like the approach taken in your patch. I would instead
prefer if you could do something like this:

 * A separate nginx-naxsi package, which just downloads and extracts
   the source code of the third party module. It should be like 4 lines
   of code, using the generic-package infrastructure.

 * Then, in nginx.mk, if BR2_PACKAGE_NGINX_NAXSI is enabled, you add a
   dependency on it, and add a pre-configure hook that creates a
   symbolic link from the appropriate location in the nginx source tree
   to the directory where nginx-naxsi was extracted.

Could you try something like this?

It is worth mentioning that since nginx 1.9.1, they have added the
possibility of building modules as shared objects that are loaded at
runtime, and they are planning in the future to allow third party
modules to be built separately from nginx itself. See
https://www.nginx.com/blog/dynamic-modules-nginx-1-9-11/:

"""
In future releases, we plan to add the ability to compile modules after
the NGINX binary has been compiled.
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
