From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 2 Mar 2014 10:50:41 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140302095754.13319d04@skate>
References: <20140302073008.028A91015DC@stock.ovh.net>
 <20140302095754.13319d04@skate>
Message-ID: <CAHXCMM+qbZL-iXQzVA6CBOWYq4JuNG0XcB-dWnHkeFq5do38Bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sun, Mar 2, 2014 at 9:57 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[...]
>>        arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/1ee0d18f2a9e45b94e4db04fd5c54e6f7994b1be/
>>    powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/d1421f2063ecfea9c4110414f481f779defa8ad5/
>
> Scons is not compatible with Python 3. But host-scons is not a target
> package, it's a host package, so we cannot add a Python 3 related
> dependency to it. So the two solutions that I see are:
>
>  * Change our host-python and host-python3 packages so that they are
>    not exclusive from each other, and then find a way for host-scons to
>    express the fact that it really needs host-python, and not the
>    host-python version matching the selected target python version.
>    Note that achieving this might be difficult.

host-python and host-python3 are exclusive at the kconfig level, not
the make target one, right or am I missing something?
AFAICS the only overlapping thing between the 2 host package is the
$(HOST_DIR)/usr/bin/python symlink.

So, we could imagine building host-python and host-python3 in the same build.
In such a case, the tricky point becomes the
$(HOST_DIR)/usr/bin/python symlink management:
- host-python should not install the symlink if python3 is enabled;
- host-python3 should deactivate the symlink installation when python
is enabled.
Then, the SCONS variable should explicity refer to
"$(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons"
So, we could be able to build host-python (for host-scons) even if
python3 is enabled.

host-python is the only package providing python2 stuff we would allow
to build when python3 is enabled.

For other packages, it should not change anything since the
$(HOST_DIR)/usr/bin/python symlink still reflects the configuration
(ie. its points to python3 if python3 is enabled, to python if
python(2) is enabled).
For example, crda needs host-python-m2crypto. Since there is no change
in the buildroot configuration (ie. the BR2_PACKAGE_PYTHON and
BR2_PACKAGE_PYTHON3 will still have the right value) and
$(HOST_DIR)/usr/bin/python still reflect this configuration,
host-python-m2crypto should still be built against the right python
version.

Of course, if we choose this way, it requires tests.

Comments?

>
>  * Make the three target packages that actually need host-scons
>    "depends on !BR2_PACKAGE_PYTHON3". This is a bit ugly, but the next
>    version of SCons is supposed to support Python 3, so we could
>    consider it as a temporary solution.

I've just checked out scons repository and it cannot be bootstraped
with python3 :'(

>
> Suggestions?

See above ;)

Regards,


-- 
Samuel
