From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Thu, 27 Feb 2020 15:56:34 +0100
Subject: [Buildroot] [PATCH 3/3] package/python-iptables: use installed
 iptables by default
In-Reply-To: <20200226163322.675b66f5@windsurf>
References: <20200226142617.4170-1-frank.vanbever@essensium.com>
 <20200226142617.4170-3-frank.vanbever@essensium.com>
 <20200226163322.675b66f5@windsurf>
Message-ID: <1831645.BBFHC3lhqW@wintermute>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for the comments.

 > But overall, is there a better way ? Like some official way to pass
> these values at build time as setup.py options, with the environment
> variable taking precedence if available ? That would make this
> hopefully acceptable by upstream. Perhaps the setup.py logic could even
> check the xtables-version.h by itself ?

For installations from source this would work. [1] However Python also has the 
option of distributing Wheel binary packages, where this logic would not be 
executed. [2] This would mean that we put the burden of handling the difference 
between installations on the upstream.

I took a second look and actually I think I can propose a workaround to the 
upstream. There's 2 problems that need to be tackled.

The first one is loading libxtables.so. iptables installs a libxtables.so 
symlink without any version. CDLL has no issues with this so it can just try 
and load that if all the other attempts fail.

The second problem is the location of the XTABLES_LIBDIR. Right now it tries 
all paths that are mentioned in the output of ldconfig -N -v. I guess it 
wouldn't be that much of a stretch to test some sensible locations (/usr/
local/lib/xtables, /usr/lib/xtables etc) if that should fail, in the same vein 
as the libc solution. It's not clean but it gets the job done.

I'll see if I can whip something up and submit it upstream.

Best regards,
Frank

[1] https://stackoverflow.com/questions/20288711/post-install-script-with-python-setuptools
[2] https://github.com/pypa/setuptools/issues/1782
