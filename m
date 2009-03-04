From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Mar 2009 21:17:35 +0100
Subject: [Buildroot] iproute: fix makefile
In-Reply-To: <1236077910-15674-2-git-send-email-razzor@kopf-tisch.de> (Olaf
	Rempel's message of "Tue\, 3 Mar 2009 11\:58\:23 +0100")
References: <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
Message-ID: <877i35gi00.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olaf" == Olaf Rempel <razzor@kopf-tisch.de> writes:

 Olaf> - bump version to 2.6.28
 Olaf> - fix download
 Olaf> - change compile ordering (build tc after ip)
 Olaf> - remove both binaries from target when cleaning up

Thanks, committed as r25529 except for:

 Olaf>  $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY): $(IPROUTE2_DIR)/$(IPROUTE2_BINARY)
 Olaf> -	install -Dc $(IPROUTE2_DIR)/ip/ip $(TARGET_DIR)/sbin/ip
 Olaf> -	install -Dc $(IPROUTE2_DIR)/$(IPROUTE2_BINARY) $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
 Olaf> +	$(INSTALL) -m 0755 -s $(IPROUTE2_DIR)/ip/ip $(TARGET_DIR)/sbin/ip
 Olaf> +	$(INSTALL) -m 0755 -s $(IPROUTE2_DIR)/$(IPROUTE2_BINARY) $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)

install -s doesn't work when cross compiling. Fixed to use a seperate
$(STRIPCMD) invocation.

-- 
Bye, Peter Korsgaard
