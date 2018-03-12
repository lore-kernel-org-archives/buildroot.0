From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 11 Mar 2018 22:19:16 -0300
Subject: [Buildroot] [PATCH v2 5/7] support/dockerfile: install flake8
References: <20180311085119.GA2429@scaer>
Message-ID: <5aa5d594c6c4_510118947ec236be@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thank you for your review.

Now I see the entire series is missing from patchwork.
Well... I need to send v3 anyway.
I will manually accept your review tags in the other patches.

On Sun, Mar 11, 2018 at 05:51 AM, Yann E. MORIN wrote:

> On 2018-03-11 02:15 -0300, Ricardo Martincoski spake thusly:
[snip]
>> +# For check-flake8
>> +RUN pip install -q setuptools
>> +RUN pip install -q flake8==3.5.0 mccabe==0.6.1 pycodestyle==2.3.1 pyflakes==1.6.0
> 
> Please, run this with a single RUN command, to minimise the inter;ediate
> layers.

OK.

> 
> Also, you need to explain why you install setuptools separately, and why

I don't know the root cause for that. I tried (few months ago in the docker
image) and installing setuptools and packages together didn't worked.
Even in the docs, setuptools is assumed to be installed before installing
packages.
https://packaging.python.org/tutorials/installing-packages/#requirements-for-installing-packages
But I will add this info to the commit log.

> you don't force the version for it.

Same here. I don't know the internals to say why we should always use the
latest version. But maybe an acceptable approach is to use the exact command
line the docs recommend (I didn't tried yet, but it should work):

python -m pip install --upgrade pip setuptools wheel

This way the docker image will be ready to install any package we eventually
need.

> 
> Finally, , have a single pacakge on each line, so that it is easier to
> maintain.
> 
>     RUN pip install -q setuptools && \
>         pip install -q \
>             flake8==3.5.0 \
>             mccabe==0.6.1 \
>             pycodestyle==2.3.1 \
>             pyflakes==1.6.0

Indeed, much easier to maintain. I will do.


Regards,
Ricardo
