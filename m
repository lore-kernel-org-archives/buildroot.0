From: Pragash Jeyaratnam <pragash.jeyaratnam@gmail.com>
Date: Wed, 18 Mar 2020 10:54:29 -0400
Subject: [Buildroot] Inquiry : Adding a custom python package to
 buildroot
In-Reply-To: <CALYA+Yvspb-eeK7KWeAJn2bYtwWq4NK4W6usw6Ts+2OwQ0XLzw@mail.gmail.com>
References: <CALYA+Yvspb-eeK7KWeAJn2bYtwWq4NK4W6usw6Ts+2OwQ0XLzw@mail.gmail.com>
Message-ID: <CALYA+Ys78xtOdKSQZVwgf-QVjU2j+69-uEJg87FJYUJb1j9WGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Adding to my previous email. The problem is due to python setup.py issue
within custom modules. For example If we assume,
If a setup.py which has configuration

setup(name='your-module',
      .....
      data_files=[
        ('/usr/share/your_module/', glob.glob('data/*')),
      ],
     )

The above failure will occur ( Absolute path reference) . As per to the
setup.py manual https://docs.python.org/3/distutils/setupscript.html
"The *directory* should be a relative path. It is interpreted relative to
the installation prefix"

So in-order to satisfy the above the configuration should be changed to
  setup(name='your_module',
      .....
      data_files=[
        ('share/your_module/', glob.glob('data/*')),
      ],
     )

Which will be created as per to the installation_prefix/share/your_module.

Hope it was helpful.

Regards,
Pragash



On Wed, Mar 18, 2020 at 10:25 AM Pragash Jeyaratnam <
pragash.jeyaratnam@gmail.com> wrote:

> Hi,
>
> I tried to add a custom python package to buildroot, during build I am
> getting following error message.
>
> creating /usr/share/sona
> error: could not create '/usr/share/sona': Permission denied
> package/pkg-generic.mk:311: recipe for target
> '/home/branches/sona/build/dist/build/python-sona-engine-1.0/.stamp_target_installed'
> failed
> make[1]: ***
> [/home/branches/sona/build/dist/build/python-sona-engine-1.0/.stamp_target_installed]
> Error 1
> Makefile:23: recipe for target '_all' failed
> make: *** [_all] Error 2
>
> Would it be possible for anyone to guide me on how to fix the above issue ?
>
> Thank you.
>
> Regards,
> Pragash
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200318/4931e0ea/attachment.html>
