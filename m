From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Dec 2014 09:15:30 +0100
Subject: [Buildroot] [PATCH v4 9/9] autobuild-run: extend TODO list
In-Reply-To: <CAAXf6LU07xn6QoE9Np72W_hwy_W3Rh9uozSA1+QX7=TL-_f04g@mail.gmail.com>
References: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
 <1415822317-22500-10-git-send-email-patrickdepinguin@gmail.com>
 <CAAXf6LVgM33BfF2M4xCJebq4s+Rj8XjXzWxwU4YnJ4zotEJZ5w@mail.gmail.com>
 <20141125222025.1ce56775@free-electrons.com>
 <CAAXf6LU07xn6QoE9Np72W_hwy_W3Rh9uozSA1+QX7=TL-_f04g@mail.gmail.com>
Message-ID: <20141205091530.0ca014e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 4 Dec 2014 21:41:24 +0100, Thomas De Schampheleire wrote:

> > Thanks for this investigation. It would indeed be really nice to be
> > able to kill just autobuild-run, and be sure that it stops all
> > underlying builds. We could also catch the signal in autobuild-run, and
> > kill the build jobs, if we are able to record the necessary information
> > about them.
> 
> Brief update: the piece of the puzzle that is causing a new process
> group to be spawned is the 'timeout' command. Everything started under
> the timeout command runs in its own process group, different than the
> one of the python process. Therefore, killing the python process group
> does not kill the timeout+make command.
> 
> The solution is to use subprocess.Popen instead of subprocess.call so
> we can obtain the pid of the timeout call, and change the signal
> handler to explicitly kill this second process group too.
> 
> I still have to make the changes in autobuild-run (currently worked on
> a simple test program), and will submit patches when ready...

Ok, great. Another approach maybe would be to not use timeout, and
instead make the Python script itself monitor the duration of the build
it starts, and kill them if they took too long.

Thanks again for the investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
