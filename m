From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 21:21:27 +0200
Subject: [Buildroot] [PATCH] glmark2: depend on host-python
In-Reply-To: <1443194731-52284-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443194731-52284-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150927212127.2e70faeb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Fri, 25 Sep 2015 16:25:31 +0100, Vicente Olivert Riera wrote:
> The waf build system of glmark2 needs Python 2 as stated on its README
> file:
> 
> python 2.x (>= 2.4) for the build system (waf)
> 
> Building it with a system with Python 3 as the default Python version
> will result on a failure like this one:
> 
> File "waflib/Utils.py", line 199
>     except OSError ,e:
>                    ^
> SyntaxError: invalid syntax
> 
> So, in order to fix this, make this package depending on host-python and
> also run the waf script using $(HOST_DIR)/usr/bin/python2.

This part is fine.

> At the same time fix a typo in the .mk file. The python-config script is
> localed at $(HOST_DIR)/usr/bin/ instead of $(STAGING_DIR)/usr/bin/.

But I'm not sure at all about this part.
$(HOST_DIR)/usr/bin/python-config will give results that are valid to
build things against the *host* Python, while
$(STAGING_DIR)/usr/bin/python-config will give results that are valid
to build things against the *target* Python.

Therefore, it is necessary to look into the Waf logic to understand how
PYTHON_CONFIG is used. Is it used to build just things that used
during the build process and therefore probably built against the host
Python, or is it about building things against the target Python?

From a quick look, I don't see anything in the glmark2 source code that
would need Python. It's really only waf itself that uses Python. So I
don't quite see where PYTHON_CONFIG can actually be useful...

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
