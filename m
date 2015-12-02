From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Dec 2015 20:58:16 +0000
Subject: [Buildroot] [Bug 8296] nodejs 0.12.7 - npm crashes (seg core dump)
In-Reply-To: <bug-8296-163@https.bugs.busybox.net/>
References: <bug-8296-163@https.bugs.busybox.net/>
Message-ID: <bug-8296-163-dC0CxdJY8j@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8296

--- Comment #5 from Arnout Vandecappelle <arnout@mind.be> ---
(In reply to Martin from comment #4)
> Created attachment 6241 [details]
> backtrace from npm core dump
> 
> I have attached a back trace from the npm crash.  I see
> node::os::GetInterfaceAddresses is called so as an experiment i tried the
> following javascript
> 
>     var os = require('os');
>     var ifaces = os.networkInterfaces();
>     console.log(ifaces);
> 
> This produces the same back trace as running npm.  Running this code using
> glibc works.  So it seems the issues is npm is using os.networkInterfaces()
> which works with glibc but not uclibc.
> 
> You can find the code for node::os::GetInterfaceAddresses in node.js v0.12.7
> here
> https://github.com/nodejs/node/blob/d3492aa7b386946e3a156440cad346e5b0a82838/
> src/node_os.cc#L225-L300.
> 
> The back trace shows the crash is in OneByteString which is called in
> several places in node::os::GetInterfaceAddresses.  The data it's operating
> on comes from a call to uv_interface_addresses() which is part libuv that's
> in node.js.  The code for uv_interface_addresses() is here
> https://github.com/nodejs/node/blob/d3492aa7b386946e3a156440cad346e5b0a82838/
> deps/uv/src/unix/linux-core.c#L786-L878.
> 
> I suspect uv_interface_addresses() is where the issue lies.

 Can you check if libuv's config.h has HAVE_IFADDRS_H ? If not, there is an
obvious bug in node::os::GetInterfaceAddresses: it will loop using the
uninitialized count variable when err == UV_ENOSYS. There's a missing return in
that condition.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
