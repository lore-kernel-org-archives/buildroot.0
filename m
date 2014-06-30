From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 30 Jun 2014 15:45:05 +0200
Subject: [Buildroot] Buildroot eclipse integration: doesn't work with custom
	BR2_HOST_DIR
Message-ID: <CAAXf6LVxOJ4h+CcYT1JGneo24OfymmqXrPdVN2C-UXKWg3eczw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Normally, BR2_HOST_DIR is $(BASE_DIR)/host which is
<buildroot>/output/host. However, the user can set a custom
BR2_HOST_DIR in the buildroot configuration.

If you do that, and select the registration of the toolchain against
eclipse, you get:

./support/scripts/eclipse-register-toolchain `readlink -f output`
i686-pc-linux-gnu- "i586"
Your project directory does not look like a Buildroot output
make: *** [target-finalize] Error 1

This is because eclipse-register-toolchain script does:

if test ! -d ${project_directory}/host ; then
    echo "Your project directory does not look like a Buildroot output"
    exit 1
fi

(where project_directory is the first parameter) and thus assumes that
host is under <buildroot>/output which is not correct if you set
BR2_HOST_DIR explicitly to a custom value.

I'm not sure about the internals of the Buildroot Eclipse plugin, so
it is unclear to me which freedom we have regarding changing the
helper script.

Feedback welcome,

Best regards,
Thomas
