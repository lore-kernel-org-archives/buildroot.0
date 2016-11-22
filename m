From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Nov 2016 23:16:30 +0100
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <20161122212534.GA3529@free.fr>
References: <20161122212534.GA3529@free.fr>
Message-ID: <20161122221630.GC3529@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-11-22 22:25 +0100, Yann E. MORIN spake thusly:
> We recently switched from using fakeroot to using pseudo to generate the
> filesystem images.
> 
> After fixing the biggest fallouts from the conversion, we're still left
> with a few users reporting remaining issues.

And we have another issue, that Lucille and Ga?l just tracked down.

They are using a docker instance to run their Buildroot builds, and
noticed that the pseudo DB was empty after a build. However, if they
artificially added a little sleep at the end, to prevent the docker
instance to terminate instantly, the pseudo DB was correctly saved.

That's becasue pesuedo spawns itself a server in the background, and
that server is responsible for loading the DB, maintaining the internal
state, and saving the DB.

However, the DB is saved aftrer the last client exits, adn it can t ake
a bit of time, which is enought time for the docker instance to
terminate, killing (-9) the remaining processes, of whihch the pseudo
server, which then does not have a chance to save its DB.


One solution to this issue would be for us to run our own pseudo server,
adn terminat it ourselves, then wait for it, something along those lines:

    # Spawn our server
    pseudo -f
    pseudo_pid=$!

    # Run the actual comand
    pseudo real-command

    # Kil and wait for the server
    pseudo -S
    wait $pseudo_pid


Thoughts? Tests? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
