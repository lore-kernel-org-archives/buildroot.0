From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 19:08:59 +0100
Subject: [Buildroot] [PATCH 1/1] Avoid toolchain download when it is
 preinstalled
In-Reply-To: <527A6142.4070608@gezedo.com>
References: <527A1C86.8030909@gezedo.com> <20131106161903.2b28e917@skate>
 <527A6142.4070608@gezedo.com>
Message-ID: <20131106190859.6ab00fdc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Laurent GONZALEZ,

(Please fix your e-mail client to wrap lines at around 80 columns,
except of course when you send patches!).

On Wed, 06 Nov 2013 16:33:22 +0100, Laurent GONZALEZ wrote:

> > So that TOOLCHAIN_EXTERNAL_SOURCE is empty when the external toolchain
> > is locally installed. Having an empty <pkg>_SOURCE is what tells the
> > package infrastructure to not download the thing.
> > 
> 
> I am afraid this won't work, because I really want to choose some 'codesourcery' toolchain *and* avoid download. Preinstalled toolchain has larger scope than custom toolchain.
> By the way my patch had another issue, that i will fix and resubmit soon.

Aaah, yes, indeed. In this case, I think I'd prefer to have something
like:

ifeq ($(codesourcery...),y)
...
else ifeq ($(someothertoolchain...),y)
...
else
... custom toolchain origin
endif

# In fact, we don't need to download the toolchain, since it is already
# available on the system, so force the site and source to be empty so
# that nothing will be downloaded/extracted.
ifeq ($(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
TOOLCHAIN_EXTERNAL_SITE =
TOOLCHAIN_EXTERNAL_SOURCE =
endif

It's just that I find the big enclosing ifeq
($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y) condition a little bit difficult
to follow.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
