From: Erik Schumacher <schumacher574@gmail.com>
Date: Tue, 21 Nov 2017 13:44:34 -0800
Subject: [Buildroot] [PATCH 09/12] docker-containerd: bump to 3addd84
Message-ID: <CALE8038WQBmE71HWwto_3j3XMReeqRwdC3JUvbRXpyuLhbJohA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to patch 11/12, DOCKER_CONTAINERD_BUILD_CMDS changed from
$(HOST_DIR)/bin/go
to $(HOST_DIR)/usr/go (bin -> usr), which causes builds to fail:

 define DOCKER_CONTAINERD_BUILD_CMDS
 	$(foreach d,ctr containerd containerd-shim,\
-		cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/bin/go build \
+		cd $(DOCKER_CONTAINERD_GOPATH)/src/github.com/containerd/containerd; \
+			$(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/go build \
 			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./$(d)$(sep))
 endef

Again, not sure if this is due to another patch from another series that I
may be missing?  Switching path back to $(HOST_DIR)/bin/go causes builds to
succeed.

Thanks,
Erik
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171121/68e56bfd/attachment.html>
