From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 10:34:57 +0200
Subject: [Buildroot] [PATCH v2 6/6] support/testing: fix remaining code
	style
In-Reply-To: <59ed54297386a_5e461a34548181f6@ultri3.mail>
References: <84479e08-ca74-2ebe-4d14-13758b227689@mind.be>
 <59ed54297386a_5e461a34548181f6@ultri3.mail>
Message-ID: <270bdcac-d8f0-d6db-bd84-f850a2d645bc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 04:30, Ricardo Martincoski wrote:
> Hello,
> 
> On Fri, Oct 06, 2017 at 02:16 PM, Arnout Vandecappelle wrote:
> 
>> On 05-10-17 23:42, Ricardo Martincoski wrote:
> [snip]
>>> Number of warnings reported by flake8 for the test infra:
>>> before:   2
>>> after:    0
>>
>>  I still have a warning:
>>
>> $ python -m flake8 support/testing/
>> support/testing/tests/init/base.py:45:9: N803 argument name should be lowercase
>>
>>  Any idea why you didn't catch this?
> 
> That's because you have flake8 plugin pep8-naming installed, which default to
> on.
> To always disable it (to ignore such warnings and get the same result with or
> without it) this line could be added to .flake8:
> ignore=N

 I don't think we want that.

> I don't know a way to enforce it is always installed (to always generate such
> warnings and get the same result).

 We don't need to enforce it. What we need is to make sure that GitLab-CI does
have this, so it *will* check the naming (when we have a test for flake8,
obviously). You can do that by updating support/docker/Dockerfile (and I'll
rebuild the docker image when I apply the patch).


> To also ignore warnings generated when the plugin flake8-docstrings is
> installed, this line could be used instead:
> ignore=N,D

 Good idea, let's check the docstrings as well!


>>  Also, there are still warnings in support/scripts and utils, care to take a
>> look at those?
> 
> I will.

 It's not urgent. Well, that is, until we start failing gitlab-CI because of it :-)

> 
>>  Also, you used to have a patch that ran flake8 from .gitlab-ci.yml, but it
>> seems to be gone from patchwork.
> 
> Yes, that was
> http://patchwork.ozlabs.org/patch/820324/
> 
> The main purpose (to check the test infra even if/when the tests become placed
> in each package directory) was replaced by the .flake8 file in the main
> directory. 
> http://patchwork.ozlabs.org/patch/822105/

 I don't really see any relation between the two... Patch 820324 creates a
flake8 test, patch 822105 creates a flake8 config.

 OK, now I look at patch 820324, I think it's not the right approach. There is
no point making a unit test for that.  All we want is an update to
.gitlab-ci.yml.in that adds something like this:

check-flake8:
    before_script:
        - apt-get update -qq
        - apt-get install -y -qq --no-install-recommends
            python3-flake8 python3-pep8-naming python3-flake8-docstrings
    script:
        - flake8

There is no real need to add flake8 to the Docker image since it's only used for
this one test. And we can simply run flake8 at the top level; it's exit code
will indicate failure.

 Oh, now I notice that this won't work because our test infra is not Python3
compliant. That would be nice to fix as well :-) Apparently docstrings only
exists for python3 (at least on my Debian, don't know about Ubuntu).

 Regards,
 Arnout


> 
> I should have replied to the first one explaining I marked it as Superseded by
> the second one.
> 
> If you think the first patch is useful feel free to review it so I can respin,
> or even take over if you wish.
> 
>>  And finally, if you have nothing else to do :-), maybe you could make the tests
>> python3 compatible. For me, it'd be fine to even require python3 to be able to
>> run the tests, if that simplifies things.
> 
> I will do later (I guess in next December/January).
> 
> Regards,
> Ricardo
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
