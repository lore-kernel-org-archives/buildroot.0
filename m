From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 23 Nov 2016 00:44:20 -0500
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <20161122221630.GC3529@free.fr>
References: <20161122212534.GA3529@free.fr>
 <20161122221630.GC3529@free.fr>
Message-ID: <20161123054206.na5yabxtvnrzocz4@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Nov 22, 2016 at 11:16:30PM +0100, Yann E. MORIN wrote:
> And we have another issue, that Lucille and Ga?l just tracked down.
> 
> They are using a docker instance to run their Buildroot builds, and
> noticed that the pseudo DB was empty after a build. However, if they
> artificially added a little sleep at the end, to prevent the docker
> instance to terminate instantly, the pseudo DB was correctly saved.
> 
> That's becasue pesuedo spawns itself a server in the background, and
> that server is responsible for loading the DB, maintaining the internal
> state, and saving the DB.
> 
> However, the DB is saved aftrer the last client exits, adn it can t ake
> a bit of time, which is enought time for the docker instance to
> terminate, killing (-9) the remaining processes, of whihch the pseudo
> server, which then does not have a chance to save its DB.
> 
> 
> One solution to this issue would be for us to run our own pseudo server,
> adn terminat it ourselves, then wait for it, something along those lines:
> 
>     # Spawn our server
>     pseudo -f
>     pseudo_pid=$!
> 
>     # Run the actual comand
>     pseudo real-command
> 
>     # Kil and wait for the server
>     pseudo -S
>     wait $pseudo_pid
> 

I was thinking the same thing... spawning our own server to make sure it
terminates before the wrapper completion.

> 
> Thoughts? Tests? ;-)

After regarding the code of pseudo, the easiest workaround is to update the
wrapper script to do what you mentionned above.

I have suggested a patch named:
[PATCH] pseudo-wrapper: fix console issue

This works on my setup either with a traditional build (on host) or with our
docker wrapper.
