From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 00:35:34 +0200
Subject: [Buildroot] [PATCH 5/5] legal-info: properly error out on
 missing license file
In-Reply-To: <53A206E0.9000506@lucaceresoli.net>
References: <cover.1402758331.git.yann.morin.1998@free.fr>
 <8c742a7155e0b24c14ae90f7be00c1043eceb848.1402758331.git.yann.morin.1998@free.fr>
 <53A206E0.9000506@lucaceresoli.net>
Message-ID: <20140621223534.GD21004@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-06-18 23:38 +0200, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >When saving the license files, if a declared license file is missing,
> >print a proper error message, instead of the sometime-criptic error
> >message from 'cp'.
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Cc: Luca Ceresoli <luca@lucaceresoli.net>
> >Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> >Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> >
> >---
> >Note: when I wrote this back in March 2014, I had a concrete example of
> >a criptic error message (the name of the license did not make it obvious
> >we were saving a license file?), but today I can't remember what it was
> >exactly.
> >
> >Since I believe showing a properly-formatted error message to the user
> >is anyway a good thing, I kept that patch. Feel free to ditch it if you
> >don't like it.
> 
> I may be missing something, but I wonder what cryptic error you had
> seen.

Well, now I tried again, that's what I observed:

    $ make legal-info
    [--SNIP--]
    >>> busybox 1.22.1 Extracting
    bzcat /home/ymorin/src/busybox-1.22.1.tar.bz2 | tar --strip-components=1
    -C /home/ymorin/dev/buildroot/O/build/busybox-1.22.1  -xf -
    cat: /home/ymorin/dev/buildroot/O/build/libfslcodec-3.5.7-1.0.0/EULA: No
    such file or directory
    make[1]: *** [libfslcodec-legal-info] Error 1

So, OK, the error is explicitly about fslcodec. But remember that the
line  ">>> busybox 1.22.1 Extracting"  is highlighted, and thus what
stand out is the 'busybox' package, and it took me a while to understand
why on Earth busybox was trying to save an EULA file, when moments later
I saw that it was in fact in the libfslcodec package...

But since this series is expressly about this error case (no-redistribute
packages failed to save the license files), the initial error should be
handled.

I'll redo my tsting here to see if that's still a concern now...

> With your patch applied:
> 
>   ERROR: busybox: license file LICENSE not found
> 
> This is much more concise, but gives a less info about where the
> LICENSE file should be found. To the inexperienced user, the path might
> be a useful hint.
> OTOH, the "ERROR: busybox: " prefix is very informative.
> 
> How about changing your message to:
>   ERROR: busybox: license file LICENSE not found in /.../busybox-1.22.1/
> or
>   ERROR: busybox: license file /.../busybox-1.22.1/LICENSE not found

Yes, we can use the full path to the missing license file, indeed.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
