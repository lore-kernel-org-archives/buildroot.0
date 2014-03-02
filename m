From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 11:08:31 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAHXCMM+qbZL-iXQzVA6CBOWYq4JuNG0XcB-dWnHkeFq5do38Bw@mail.gmail.com>
References: <20140302073008.028A91015DC@stock.ovh.net>
 <20140302095754.13319d04@skate>
 <CAHXCMM+qbZL-iXQzVA6CBOWYq4JuNG0XcB-dWnHkeFq5do38Bw@mail.gmail.com>
Message-ID: <20140302110831.4a78427b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 2 Mar 2014 10:50:41 +0100, Samuel Martin wrote:

> host-python and host-python3 are exclusive at the kconfig level

Hum? There are no Kconfig options for host-python and host-python3.
It's the target Pythons that are mutually exclusive at the Kconfig
level. And since each target Python depends on the same version of
host-pythonX, this is what brings host-python3 when target python3 is
selected.

> the make target one, right or am I missing something?
> AFAICS the only overlapping thing between the 2 host package is the
> $(HOST_DIR)/usr/bin/python symlink.
> 
> So, we could imagine building host-python and host-python3 in the same build.
> In such a case, the tricky point becomes the
> $(HOST_DIR)/usr/bin/python symlink management:
> - host-python should not install the symlink if python3 is enabled;
> - host-python3 should deactivate the symlink installation when python
> is enabled.
> Then, the SCONS variable should explicity refer to
> "$(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons"
> So, we could be able to build host-python (for host-scons) even if
> python3 is enabled.

You're missing something: the host-scons package is using the
host-python-package infrastructure. And this infrastructure uses the
host Python version of the selected target Python. This is where the
core of the problem is. We would need a way to tell the
host-python-package infrastructure to make a package depend on
host-python instead of host-python3, even if the selected target Python
is Python 3.

> >  * Make the three target packages that actually need host-scons
> >    "depends on !BR2_PACKAGE_PYTHON3". This is a bit ugly, but the next
> >    version of SCons is supposed to support Python 3, so we could
> >    consider it as a temporary solution.
> 
> I've just checked out scons repository and it cannot be bootstraped
> with python3 :'(

See the Scons homepage:

"""
SCons release 2.3.0 now available from the download page at
SourceForge. This release adds new features, and fixes and improves a
number of issues. This will be the last release to support Python
versions earlier than 2.7, as we begin to move toward supporting Python
3.
"""

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
