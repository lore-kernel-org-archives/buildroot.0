From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 19:20:33 +0200
Subject: [Buildroot] [v2 4/6] package/nodejs: Add
 /usr/lib/node_modules/.bin to PATH
In-Reply-To: <CAFGQKxcrYMsVW+D2Kzwb0A7F529TctGU0KEWGtGXAsx-ATxSqg@mail.gmail.com>
References: <1435370498-25473-1-git-send-email-martin@barkynet.com>
 <1435370498-25473-4-git-send-email-martin@barkynet.com>
 <20150627224430.GE30876@free.fr>
 <CAFGQKxcrYMsVW+D2Kzwb0A7F529TctGU0KEWGtGXAsx-ATxSqg@mail.gmail.com>
Message-ID: <20150629172033.GC3669@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-06-29 10:13 +0100, Martin Bark spake thusly:
> Yes I agree your way is easier to read, I'll update my patch and resubmit it.

Great, thanls! :-)

> The reason this is useful is because there lots of node.js packages
> that are normal command line apps designed to be installed globally.
> For example, if you install http-server
> (https://github.com/indexzero/http-server) then you simple need to cd
> into any directory, type ./http-server and it will server that

You mean, http-server must be in the directory you want to serve? Or did
you mean that you just run /path/to/http-server and it will serve the
current directory?  (I guess the latter.)

> directory up for you.  Another example might be vtop
> (https://github.com/MrRio/vtop), a graphical version of top.
> 
> If you install these apps globally then all the executables will be in
> the /usr/lib/node_modules/.bin directory.  So this patch simply saves
> you typing the full path, the same as for your desktop.

OK, so why not make symlinks (or hadlinks) for each of them in /usr/bin
instead? Something like (untested):

    cd $(TARGET_DIR)/usr/bin; \
    for f in ../../usr/lib/node_modules/.bin/*; do \
        [ -f "$${f}" -a -x "$${f}" ] || continue; \
        ln -sf "$${f}" "$${f##*/}" || exit 1; \
    done

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
