From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 9 Mar 2016 11:28:09 -0300
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <20160309150359.4ce78c05@free-electrons.com>
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk> <56E02A78.1050701@zacarias.com.ar>
 <20160309150359.4ce78c05@free-electrons.com>
Message-ID: <56E032F9.4070605@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/16 11:03, Thomas Petazzoni wrote:

> What about doing this relatively to the wrapper location?
>
> WRAPPER_DIR=$(dirname $0)
> STAGING_DIR=$(readlink -f ${WRAPPER_DIR}/../../../staging/)
>
> and there you are, it is both relocatable and doesn't rely on
> STAGING_DIR being defined in the environment.
>
> Thomas

Hi.
That won't work, since staging is an absolute symlink, so when moving 
the SDK around it will be broken and fail.
You need something like:

WRAPPER_DIR=$(dirname $0)
STAGING_DIR=$(readlink -f ${WRAPPER_DIR}/../@TUPLE@/sysroot)

And hardcode tuple which isn't likely to change.
Regards.
