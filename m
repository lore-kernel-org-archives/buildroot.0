From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 23:39:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
 HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <48B4EC85-773A-4F99-96D4-59577018BAB3@gmail.com>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160728220029.GI5862@free.fr>
 <48B4EC85-773A-4F99-96D4-59577018BAB3@gmail.com>
Message-ID: <20160802233938.65d7c923@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 15:04:18 -0700, Khem Raj wrote:

> >> -HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
> >> +HOST_CPPFLAGS  = -isystem $(HOST_DIR)/usr/include  
> 
> This is quite intrusive change. avoid -isystems since it interferes with the
> default include ordering of gcc and will cause compile failure since it wont
> be able to find headers in some cases. So many packages will fail to build.
> especially gcc-6.x will hit hard

After reading your links, and reading
http://stackoverflow.com/a/37218954, I believe your concerns do not
apply to our case.

The problem with -isystem occurs when you pass -isystem with a
directory that is *already* in the default search path of the compiler.
In this case, you indeed modify the order of the directories, and
therefore cause problems for #include_next directives.

However, in our case, we want to prepend to the default search path a
completely different directory, $(HOST_DIR)/usr/include. Therefore, any
#include_next will continue to work fine.

See the stackoverflow link above, it explains this very well.

Your webkitgtk example was adding -isystem /usr/include, which is
obviously wrong. And your second link on the Fedora mailing list is
also about adding -isystem /usr/include.

So, I believe that we may see -isystem parsing issues like the Python
one fixed by David, but that generally speaking, using -isystem is the
right thing to do to solve our problem.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
