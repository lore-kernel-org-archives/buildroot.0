From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 15:32:55 +0200
Subject: [Buildroot] [PATCH 6/8] python-libxml2: new host package
In-Reply-To: <1476321239-13894-6-git-send-email-gustavo@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
 <1476321239-13894-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161028153255.5c0e15d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Wed, 12 Oct 2016 22:13:57 -0300, Gustavo Zacarias wrote:
> Add a new python-libxml2 package to build the libxml2 python bindings.
> 
> This is required for host-itstool which in turn is required to build
> evince.
> 
> Unfortunately since we can't detect host-python/host-python3 presence to
> enable it in the libxml2 package itself and leaving it to automatic
> would be problematic just make a separate package for it like
> mesa3d-headers to handle it deterministically.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

We discussed this patch during the Developers meeting, and I believe
the general consensus is that we'd instead prefer to introduce hidden
Config.in knobs for host packages.

This is not only useful for this situation, but also for other
situations.

For this one, I see two possibilities:

 * The python/python3 packages gain some hidden host Config.in options
   BR2_PACKAGE_HOST_PYTHON(3). The host-libxml2 package then looks at
   BR2_PACKAGE_HOST_PYTHON(3) and if enabled, then the python support
   in host-libxml2 is enabled.

   Drawback of this approach is that if we want to do it right, every
   package that uses host-python(3) should start selecting this new
   option.

 * The libxml2 package gains a sub-option
   BR2_PACKAGE_HOST_LIBXML2_PYTHON, which allows to enable python
   support. Of course, later we could add BR2_PACKAGE_HOST_LIBXML2 as
   well, and fix the packages that depend on host-libxml2, but it can
   be done later.

Arnout, Peter, which of those two options do you prefer? Or maybe you
were thinking of different approaches?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
