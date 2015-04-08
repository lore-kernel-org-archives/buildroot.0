From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 8 Apr 2015 22:35:34 +0200
Subject: [Buildroot] autobuild-run bug, one instance died
In-Reply-To: <20150408164316.0641eb3c@free-electrons.com>
References: <20150408164316.0641eb3c@free-electrons.com>
Message-ID: <CAAXf6LWtvbyLj74x1RrVaBFiOoZ4vS1_75gCq51NLTiLZ=ptww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Apr 8, 2015 at 4:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> I got the following backtrace on my autobuild-run instance:
>
> thomas at build:~$ Process Process-2:
> Traceback (most recent call last):
>   File "/usr/lib/python2.6/multiprocessing/process.py", line 232, in _bootstrap
>     self.run()
>   File "/usr/lib/python2.6/multiprocessing/process.py", line 88, in run
>     self._target(*self._args, **self._kwargs)
>   File "../buildroot-test/scripts/autobuild-run", line 735, in run_instance
>     ret = gen_config(**kwargs)
>   File "../buildroot-test/scripts/autobuild-run", line 473, in gen_config
>     configs = get_toolchain_configs()
>   File "../buildroot-test/scripts/autobuild-run", line 262, in get_toolchain_configs
>     with urlopen_closing(config["url"]) as r:
>   File "../buildroot-test/scripts/autobuild-run", line 134, in <lambda>
>     urlopen_closing = lambda uri: contextlib.closing(urlopen(uri))
>   File "/usr/lib/python2.6/urllib2.py", line 126, in urlopen
>     return _opener.open(url, data, timeout)
>   File "/usr/lib/python2.6/urllib2.py", line 391, in open
>     response = self._open(req, data)
>   File "/usr/lib/python2.6/urllib2.py", line 409, in _open
>     '_open', req)
>   File "/usr/lib/python2.6/urllib2.py", line 369, in _call_chain
>     result = func(*args)
>   File "/usr/lib/python2.6/urllib2.py", line 1170, in http_open
>     return self.do_open(httplib.HTTPConnection, req)
>   File "/usr/lib/python2.6/urllib2.py", line 1145, in do_open
>     raise URLError(err)
> URLError: <urlopen error [Errno -2] Name or service not known>

As Yann indicated, looks like a temporary network issue.

It should of course not cause the instance to die altogether.
I think the correct fix is to add 'try..except URLError' statements
around the urlopen_closing calls, skipping to the next build in case
of URLError.

I just sent an untested patch that does this. It's untested because I
currently don't have the time to properly test it, and already wanted
to try and deblock you.

Best regards,
Thomas
