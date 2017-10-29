From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Oct 2017 02:03:27 -0200
Subject: [Buildroot] [PATCH v2 6/6] support/testing: fix remaining code
	style
References: <270bdcac-d8f0-d6db-bd84-f850a2d645bc@mind.be>
Message-ID: <59f5530f9807a_d683ff5ec889c9036b5@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 23, 2017 at 06:34 AM, Arnout Vandecappelle wrote:

> On 23-10-17 04:30, Ricardo Martincoski wrote:
>> On Fri, Oct 06, 2017 at 02:16 PM, Arnout Vandecappelle wrote:
>>> On 05-10-17 23:42, Ricardo Martincoski wrote:
>> [snip]
>>>> Number of warnings reported by flake8 for the test infra:
>>>> before:   2
>>>> after:    0
>>>
>>>  I still have a warning:
>>>
>>> $ python -m flake8 support/testing/
>>> support/testing/tests/init/base.py:45:9: N803 argument name should be lowercase
>>>
>>>  Any idea why you didn't catch this?
>> 
>> That's because you have flake8 plugin pep8-naming installed, which default to
>> on.
>> To always disable it (to ignore such warnings and get the same result with or
>> without it) this line could be added to .flake8:
>> ignore=N
> 
>  I don't think we want that.

OK.

> 
>> I don't know a way to enforce it is always installed (to always generate such
>> warnings and get the same result).
> 
>  We don't need to enforce it. What we need is to make sure that GitLab-CI does
> have this, so it *will* check the naming (when we have a test for flake8,
> obviously). You can do that by updating support/docker/Dockerfile (and I'll
> rebuild the docker image when I apply the patch).

Good to know how to add things to the image..
I won't do that because I understand from you (below) that it's better to add
apt install python-flake8
to .gitlab-ci.yml.in in this case.

>> To also ignore warnings generated when the plugin flake8-docstrings is
>> installed, this line could be used instead:
>> ignore=N,D
> 
>  Good idea, let's check the docstrings as well!

Eventually...

By default the plugin would generate 200+ warnings because it expects every
single package, module, function, method to be documented.
I don't think it is useful to add a lot of obvious documentation, the good thing
IMO is to document the tricky ones.

So I suggest to use 'flake8 --ignore=D1' that will check the style of the
docstrings but would not generate a lot of 'Missing docstring in'.
And during the review ask for documentation on tricky parts of the code.

Of course it's not good to let a test failing in the gitlab-ci for a long time,
so let's fix style of the docstring already in the code before adding this.
I will eventually do that.
But first I will fix warnings in support/scripts and utils.

>>>  Also, there are still warnings in support/scripts and utils, care to take a
>>> look at those?
>> 
>> I will.
> 
>  It's not urgent. Well, that is, until we start failing gitlab-CI because of it :-)

I can include a patch at the end of the series that fixes warnings in
support/scripts and utils, that adds check-flake8 as you detailed below.
This way we start with a passing test.

>>>  Also, you used to have a patch that ran flake8 from .gitlab-ci.yml, but it
>>> seems to be gone from patchwork.
>> 
>> Yes, that was
>> http://patchwork.ozlabs.org/patch/820324/
>> 
>> The main purpose (to check the test infra even if/when the tests become placed
>> in each package directory) was replaced by the .flake8 file in the main
>> directory. 
>> http://patchwork.ozlabs.org/patch/822105/
> 
>  I don't really see any relation between the two... Patch 820324 creates a
> flake8 test, patch 822105 creates a flake8 config.
> 
>  OK, now I look at patch 820324, I think it's not the right approach. There is
> no point making a unit test for that.  All we want is an update to
> .gitlab-ci.yml.in that adds something like this:
> 
> check-flake8:
>     before_script:
>         - apt-get update -qq
>         - apt-get install -y -qq --no-install-recommends
>             python3-flake8 python3-pep8-naming python3-flake8-docstrings
>     script:
>         - flake8

Nice!

> There is no real need to add flake8 to the Docker image since it's only used for
> this one test. And we can simply run flake8 at the top level; it's exit code
> will indicate failure.
> 
>  Oh, now I notice that this won't work because our test infra is not Python3
> compliant. That would be nice to fix as well :-) Apparently docstrings only
> exists for python3 (at least on my Debian, don't know about Ubuntu).

I started the image buildroot/base locally and using pip it succeeds for python
2:
apt update
apt install python-pip
pip install flake8-docstrings

[snip]
>>>  And finally, if you have nothing else to do :-), maybe you could make the tests
>>> python3 compatible. For me, it'd be fine to even require python3 to be able to
>>> run the tests, if that simplifies things.
>> 
>> I will do later (I guess in next December/January).

Regards,
Ricardo
