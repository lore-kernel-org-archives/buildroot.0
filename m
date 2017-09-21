From: Christian Stewart <christian@paral.in>
Date: Fri, 22 Sep 2017 00:13:08 +0100
Subject: [Buildroot] [PATCH 1/9] dumb-init: new package
In-Reply-To: <afa4f137-1ef8-6257-64ca-5ffc4b0f4d6c@mind.be>
References: <20170920030210.19446-1-christian@paral.in>
 <20170920030210.19446-2-christian@paral.in>
 <afa4f137-1ef8-6257-64ca-5ffc4b0f4d6c@mind.be>
Message-ID: <CA+h8R2qdgu4DUiWN7fOA22MhuqzdEOdnRN0iDc7_wxfEsVT3uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Sep 21, 2017 at 10:23 PM, Arnout Vandecappelle:
>  I really don't understand this requirement. The container is supposed to
> contain this dumb-init executable as well as the rest of the Buildroot-generated
> filesystem, right? So all required libs + dynamic loader will be there. Why does
> it need to be static, then? Is it going to be executed outside of the container?

The container is NOT supposed to contain this. Putting dumb-init and
tini inside the container was a workaround for when Docker did not
init the containers properly with a pid 1 manager. Docker has fixed
this "issue" by adding the --init option to the run command which uses
the provided docker-init binary as the PID 1. It will be executed
INSIDE the container as the Pid 1, and has no access to the parent
system.


>  So please improve your explanation :-) Also, add it to the help text, so that
> the user gets an idea why they would want to enable the option.

The option is enabled automatically by docker-engine as a dependency
because it will not work at all without building it statically. The
option is there so that if you decide for some reason you want tini or
dumb-init in your target system with the absence of docker, which is
valid in some cases where you might be doing a cgroup isolation / jail
/ other pid 1 situation without Docker and still want the init
process.

Christian
