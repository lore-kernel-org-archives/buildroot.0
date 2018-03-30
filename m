From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 00:32:09 -0300
Subject: [Buildroot] [PATCH v3 4/5] support/scripts/pkg-stats-new: add
 latest upstream version information
References: <20180323205455.24789-5-thomas.petazzoni@bootlin.com>
Message-ID: <5abdafb9f40dc_40bd3f9b153831d819346@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Mar 23, 2018 at 05:54 PM, Thomas Petazzoni wrote:

[snip]
> Since release-monitoring.org is a bit slow, we have 8 threads that
> fetch information in parallel.

I disagree with this explanation.
As I see, the problem with release-monitoring.org is that its API v1 forces us
to create a request per package. The consequence is that we have to make 2000+
requests. Doing it in a serialized way is what brings the slow down.
The response time for a single request to the site seems reasonable to me.

[snip]
> ---
> Changes since v2:
> - Use the "timeout" argument of urllib2.urlopen() in order to make
>   sure that the requests terminate at some point, even if
>   release-monitoring.org is stuck.

When I run the script and one request timeouts, the script still hangs at the
end.

Also at any moment after the first HTTP request any CTRL+C is ignored and the
script is not interruptible by the user. I had to kill the interpreter to exit.

It seems it is possible to properly handle this using threading.Event() +
signal.SIGINT... but wait! It is getting too complicated.
So I thought there must be a better solution.
I did some research and I believe there is.
Let me propose another alternative solution. This time not in the dynamic of the
script but in the underlying modules used...

[snip]
> +from Queue import Queue
> +from threading import Thread

There is a lot of tutorials and articles in the wild saying this is the way to
go. After some digging online I think most of these articles are incomplete.
This seems to be a more complete article about these modules:
https://christopherdavis.me/blog/threading-basics.html


But then I tested the module multiprocessing.
IMO it is the way to go for this case.
See below the comparison.

1) serialized requests:
 - really simple code
 - would take 2 hours to run in my machine

2) threading + Queue:
 - lots of boilerplate code to work properly
 - 20 minutes in my machine

3) multiprocessing:
 - simpler code than threading + Queue
 - 16 minutes in my machine
 - 9 minutes in the Gitlab CI elastic runner:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/60290644

The demo code is here (a commit on the top of this series 1 to 4):
https://gitlab.com/RicardoMartincoski/buildroot/commit/dc5f447c30157499cd925c9e79c7bc9c29252219

Of course, as any solution, there are some downsides.
 - Pool.apply_async can't call object methods. There are solutions to this using
   other modules, but I think the simpler code wins. We just need to offload the
   code that runs asynchronously to helper functions. Yes, like you did in a
   previous iteration of the series.
 - more RAM is consumed per worker. I did a very simple measurement and htop
   shows 60MB per worker. I don't think it is too much in this case. I did not
   measured the other solutions.

Can we switch to use multiprocessing?

[snip]
> +    def get_latest_version_by_distro(self):
> +        try:
> +            req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "project", "Buildroot", self.name))
> +            f = urllib2.urlopen(req, timeout=15)
> +        except:

Did you forgot to re-run flake8?

Using bare exceptions is bad.
https://docs.python.org/2/howto/doanddont.html#except

You can catch all exceptions from the request by using:

        except urllib2.URLError:

[snip]
> +    def get_latest_version_by_guess(self):
> +        try:
> +            req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects", "?pattern=%s" % self.name))
> +            f = urllib2.urlopen(req, timeout=15)
> +        except:

Same here.


Regards,
Ricardo
