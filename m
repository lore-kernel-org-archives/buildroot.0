From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 21:45:10 +0100
Subject: [Buildroot] [PATCH] Makefile: Store OS release in
 /usr/lib/os-release
In-Reply-To: <20180123231350.5743-1-chris.lesiak@licor.com> (Chris Lesiak's
 message of "Tue, 23 Jan 2018 17:13:50 -0600")
References: <20180123231350.5743-1-chris.lesiak@licor.com>
Message-ID: <87zi4xaf1l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Lesiak <chris.lesiak@licor.com> writes:

 > It is recommended that vendor trees store OS release information
 > in /usr/lib/os-release and that /etc/os-release should be a relative
 > symlink to /usr/lib/os-release.

 > For more details, see:

 > http://0pointer.de/public/systemd-man/os-release.html
 > Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
 > ---
 >  Makefile | 4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/Makefile b/Makefile
 > index 7d8ab51a8c..a996779232 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -729,7 +729,9 @@ endif
 >  		echo "ID=buildroot"; \
 >  		echo "VERSION_ID=$(BR2_VERSION)"; \
 >  		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
 > -	) >  $(TARGET_DIR)/etc/os-release
 > +	) >  $(TARGET_DIR)/usr/lib/os-release
 > +	@(cd $(TARGET_DIR)/etc; \
 > +		ln -sf ../usr/lib/os-release .)

The other commands are not hidden with @, so this also shouldn't be.

The above can be simplified to just:

ln -sf ../usr/lib/os-release $(TARGET_DIR)/etc

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
