From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 18 Apr 2018 21:59:27 -0300
Subject: [Buildroot] [PATCH 3/4] download/git: ensure we can checkout
 repos with submodule conversions
References: <627eaa46-0acb-9753-15a0-d805abb18164@mind.be>
Message-ID: <5ad7e9ef931d4_7af12abb1f0d94cc418cc@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Apr 18, 2018 at 05:04 AM, Arnout Vandecappelle wrote:

> On 18-04-18 05:13, Ricardo Martincoski wrote:
>>> +    _git submodule update --init --recursive --force
>> 
>> It seems --force does not exist on git 1.7.1.
>> It is still possible I did something wrong when creating the docker image.
>> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/63519024
> 
>  No, it doesn't exist.
> 
>  Note that git 1.7.1 also doesn't have the .git files in the submodules; the
> submodules have .git directories, i.e. they're indistinguishable from normal
> repos. I think that that is not a problem for this patch, since I think git
> 1.7.1 *will* kill .git directories when doing git clean --ffdx, but I'm not
> sure. Note that this implies that submodules will *not* be cached...

And that also implies the hash will not match.

So for this patch too, let's take a step back...

In release 2018.02.1 we have 2 packages in the tree with submodules:
They... well... don't work with git 1.7.1

azure-iot-sdk-c: download hungs forever
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/63672026
I tested locally using git 1.7.1 without buildroot: for azure-iot-sdk-c git
itself hangs forever on 'git submodule update --init --recursive'.

sunxi-mali: has a hash mismatch (due to the .git dir from submodule)
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/63549538

And no one complained as far as I can remember.
So by supporting git 1.7.1 with submodules, it seems to me we will add
complexity for a combination that nobody is using.

Thoughts?


Regards,
Ricardo
