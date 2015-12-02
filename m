From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Dec 2015 21:51:33 +0000
Subject: [Buildroot] [Bug 8296] nodejs 0.12.7 - npm crashes (seg core dump)
In-Reply-To: <bug-8296-163@https.bugs.busybox.net/>
References: <bug-8296-163@https.bugs.busybox.net/>
Message-ID: <bug-8296-163-U4DaMxTYug@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8296

--- Comment #6 from Martin <martin@barkynet.com> ---
(In reply to Arnout Vandecappelle from comment #5)
> (In reply to Martin from comment #4)
> > Created attachment 6241 [details]
> > backtrace from npm core dump
> > 
> > I have attached a back trace from the npm crash.  I see
> > node::os::GetInterfaceAddresses is called so as an experiment i tried the
> > following javascript
> > 
> >     var os = require('os');
> >     var ifaces = os.networkInterfaces();
> >     console.log(ifaces);
> > 
> > This produces the same back trace as running npm.  Running this code using
> > glibc works.  So it seems the issues is npm is using os.networkInterfaces()
> > which works with glibc but not uclibc.
> > 
> > You can find the code for node::os::GetInterfaceAddresses in node.js v0.12.7
> > here
> > https://github.com/nodejs/node/blob/d3492aa7b386946e3a156440cad346e5b0a82838/
> > src/node_os.cc#L225-L300.
> > 
> > The back trace shows the crash is in OneByteString which is called in
> > several places in node::os::GetInterfaceAddresses.  The data it's operating
> > on comes from a call to uv_interface_addresses() which is part libuv that's
> > in node.js.  The code for uv_interface_addresses() is here
> > https://github.com/nodejs/node/blob/d3492aa7b386946e3a156440cad346e5b0a82838/
> > deps/uv/src/unix/linux-core.c#L786-L878.
> > 
> > I suspect uv_interface_addresses() is where the issue lies.
> 
>  Can you check if libuv's config.h has HAVE_IFADDRS_H ? If not, there is an
> obvious bug in node::os::GetInterfaceAddresses: it will loop using the
> uninitialized count variable when err == UV_ENOSYS. There's a missing return
> in that condition.

HAVE_IFADDRS_H is defined at the top of the linux-core.c file.  I spotted this
code yesterday but a second look today and I see the issue.  The following snip
is from 

#define HAVE_IFADDRS_H 1

#ifdef __UCLIBC__
# if __UCLIBC_MAJOR__ < 0 || __UCLIBC_MINOR__ < 9 || __UCLIBC_SUBLEVEL__ < 32
#  undef HAVE_IFADDRS_H
# endif
#endif


I think this is trying to say if uclibc version is < 0.9.32 but the logical or
is wrong, it should be and.  It means HAVE_IFADDRS_H is indeed undefined.  If i
change this to logical and then npm works.

Also, this code is not in node.js 0.10.40 which is why it works.

I'll work on a patch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
