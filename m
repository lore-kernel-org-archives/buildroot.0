From: Todd Valentic <todd.valentic@sri.com>
Date: Fri, 24 Aug 2007 11:43:52 -0700
Subject: [Buildroot] Problem calling ldconfig in ext2root.mk
In-Reply-To: <20070824085448.GA13098@aon.at>
References: <46CE228B.2040907@sri.com> <20070824085448.GA13098@aon.at>
Message-ID: <46CF26E8.50507@sri.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernhard -

Thanks for taking a look at this problem.
>
> Does the attached is any better?
Just tried it and unfortunately it didn't work.

$(if $(TARGET_LDCONFIG),$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)

I think the problem here is that the "if" is evaluating as
true because the string $(TARGET_LDCONFIG) is set. What it isn't 
checking is if the actual file exists.

Would a test like this work:

   @test -x $(TARGET_LDCONFIG) && \
     $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null


or should TARGET_LDCONFIG be unset early on if it doesn't exist
(in which case your original patch would work fine)?

Todd
