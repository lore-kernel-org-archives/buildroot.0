From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 16:21:56 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-03-01
In-Reply-To: <878u20kiw7.fsf@dell.be.48ers.dk>
References: <20160302073023.58B81101BA9@stock.ovh.net>
 <CANCHnQros_GrNhEnk74UG6Q8NiwO9ZvmELezDrMjwzwwv4dCzw@mail.gmail.com>
 <20160302160423.0143a79b@free-electrons.com>
 <878u20kiw7.fsf@dell.be.48ers.dk>
Message-ID: <20160302162156.2c4d6d13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 02 Mar 2016 16:18:48 +0100, Peter Korsgaard wrote:

> The point seems to be that it is _ALWAYS_ claiming big endian, E.G. see
> this arm (not armeb!) build failure:
> 
> http://autobuild.buildroot.net/results/382/382699bbed15f598625b9296e464d1349ef559f8/build-end.log
> 
> Looking at ./auto/endianess, it tries to figure out endianess by
> building and executing a test program, and selecting little endian if
> the program exited with error code 0, otherwise big endian.
> 
> As this is done with the cross compiler and the executable cannot be run
> on the build host, the program (-loader) will exit with a non-zero exit
> code and big endian is used:
> 
> echo $ngx_n "checking for system byte ordering ...$ngx_c"
> echo >> $NGX_ERR
> echo "checking for system byte ordering" >> $NGX_ERR
> 
> 
> cat << END > $NGX_AUTOTEST.c
> 
> int main() {
>     int i = 0x11223344;
>     char *p;
> 
>     p = (char *) &i;
>     if (*p == 0x44) return 0;
>     return 1;
> }
> 
> END
> 
> ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
>           -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
> 
> eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> 
> if [ -x $NGX_AUTOTEST ]; then
>     if $NGX_AUTOTEST >/dev/null 2>&1; then
>         echo " little endian"
>         have=NGX_HAVE_LITTLE_ENDIAN . auto/have
>     else
>         echo " big endian"
>     fi
> 
> So this is horrible broken :/

Ah, I understand better. I was confused by Jeroen's report, since his
report was essentially "nginx concludes that SPARC is big endian",
which was not wrong at all.

Thanks for the explanation. Then indeed, passing NGX_HAVE_LITTLE_ENDIAN
seems like the right thing to do.

Does this means that nginx has never worked on little endian platforms ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
