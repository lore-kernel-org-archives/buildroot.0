From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Aug 2014 21:07:56 +0200
Subject: [Buildroot] permissions of downloaded source
In-Reply-To: <CANxTyt7OFibLhjuXH1fVZmxuPE5ky1yMsWG98DDyq=6tw=Scgw@mail.gmail.com>
References: <CANxTyt7OFibLhjuXH1fVZmxuPE5ky1yMsWG98DDyq=6tw=Scgw@mail.gmail.com>
Message-ID: <20140802190755.GA3806@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-08-02 14:55 -0400, Danomi Manchego spake thusly:
> Apologies if this was already addressed - I didn't follow all of the
> download helper re-org threads ...

Yes, the permission problem is already known, and I have sybmitted a new
series to fix this, and further enhance the download support, see;
    http://lists.busybox.net/pipermail/buildroot/2014-July/thread.html#102526

> Using mktemp in the download help scripts means that downloaded
> archives have 600 permissions.  On purpose?  This seems not so good
> when groups use a shared "dl" directory.  Maybe these lines in the
> download helper scripts:
> 
> mv "${tmp_output}" "${output}"
> 
> should be:
> 
> install -m0644 "${tmp_output}" "${output}"

Although it seems OK at first sight, it misses a few corner cases.

First, the user's umask is not accounted for in the above. We do not
want to create files with more permissive permissions than the user
decided with his umask.

Second, the local-files download helper may have to copy files with the
executable bit set, and this is also missing in the install command
above.

Those two are handled in the series I posted. It is still open for
comments, though, so feel free to reply to it. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
