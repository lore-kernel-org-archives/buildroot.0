From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 04 Jun 2018 00:38:24 -0300
Subject: [Buildroot] [PATCH 4/4] support/docker: use the distro-provided
 flake8
References: <20180603073627.GC23330@scaer>
Message-ID: <5b14b430566c_513b2ae6c5e64228123e@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jun 03, 2018 at 04:36 AM, Yann E. MORIN wrote:

[snip]
>> Using the Python3 version has following consequences:
>> 
>> 1) .gitlab-ci.yml* would need to be changed, otherwise the job fails:
>> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/72023274
> 
> Why did we invoke flake8 via an explicit call to python, rather than
> flake8 directly? Was it because we installed it from PyPI, so that it
> did not install /usr/bin/flake8?

It's not because of pip/PyPI, since /usr/local/bin/flake8 is there in the
current docker image.
Sorry, I don't remember why I used the 'python -m' form. I guess I started
(before we had tagged images) using flake8 from the distro and then switched to
pip to get the bleeding-edge version, but I am not sure.

But I still think it's better that way, as one can know by looking on the
.gitlab-ci.yml that python2 is used.
We could, for instance, have 2 jobs on Gitlab: check-flake8-python2 and
check-flake8-python3. check-flake8-python2 could potentially (not tested!) warn
about constructs that would fail on old distros with only python2.
But since we don't have too many scripts I think we don't need it. And the
scripts that must run in old distros are tested in some autobuilders.

> 
> But now, I see that is exactly what we must do anyway, if we switch to
> installing python-flake8 instead of flake8. Thanks! :-)
> 
>> 2) It seems flake8 detects when the Python3 interpreter is in use and enable
>> more warnings (causing the need of patch 3).
> 
> Meh, as I said in an earlier reply: why does the interpreter of flake8
> have an impact on the code that flake8 anlyses? So, if flake8 was

This is by design. I don't know the internals, but it seems this is the way a
script can be checked to be compatible to multiple interpreter versions.

http://flake8.pycqa.org/en/3.2.1/#installation
"It is very important to install Flake8 on the correct version of Python for
your needs. If you want Flake8 to properly parse new language features in
Python 3.5 (for example), you need it to be installed on 3.5 for Flake8 to
understand those features. In many ways, Flake8 is tied to the version of
Python on which it runs."

Notice it is not only the major version that matters.
If we want to make sure our Python3 scripts are compatible to both Python 3.4
and Python 3.5 we should ensure we call flake8 under Python 3.4 (ideally under
both but I hope not much APIs are removed for minor versions). But it will
probably automagically works once you add more docker images for the big
distros in another series. So one more reason to use the flake8 version
packaged with each distro.

> written in python42, it would aply the python42 rules to python2 and
> python3 code? That's just insane... :-/

But one can have multiple installs of flake8, one for python2, one for
python3.4, one for python 3.5, one for python4.
People that write a lot of Python scripts usually use virtualenvs to keep this
manageable.

[snip]
>> 5) support/docker: use flake8 from Python 3
>>    new patch, changing python-flake8 to flake8 and changing .gitlab-ci.yml*
> 
> In the end, do we really need it? Yes, it is good to catch the legacy
> exception trapping as well as the print-is-a-function change, but that
> can also be caught during the reviews...

We don't really need it.
But it seems to me that by using it we will make any new script more
future-proof. And if something is missed during the review we will know sooner.
Notice it's only a guess. I don't use flake8 this way.


Regards,
Ricardo
